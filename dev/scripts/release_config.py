import yaml
from compose import config
from compose.config.config import ConfigDetails, ConfigFile
from compose.config.serialize import serialize_config

import os
import argparse
from shutil import copyfile

parser = argparse.ArgumentParser(description='Seosnap Release Script')
parser.add_argument('--configs', type=str, nargs='+',  help='Docker compose config files')
parser.add_argument('--tag', default='latest', help='Tag for the release containers')
args = parser.parse_args()

CONFIGS = args.configs
TAG = args.tag
OUTPUT_DIR = 'release'
WORKDIR = os.path.abspath(os.curdir)

REPLACE_MOUNTS = {
}

if not os.path.exists(os.path.join(WORKDIR, '.env')):
    copyfile(
        os.path.join(WORKDIR, './.env.example'),
        os.path.join(WORKDIR, './.env'),
    )

configs = []
for file in CONFIGS:
    print(f'Reading file: {file}')
    with open(file, 'r') as f:
        configs.append(ConfigFile(None, yaml.safe_load(f.read())))

print('Building config')
env = config.environment.Environment()
details = ConfigDetails(
    WORKDIR,
    configs,
    env
)
cfg = config.load(
    details,
    False
)


def relativize(path: str) -> str:
    result = f'./{os.path.relpath(path, WORKDIR)}' if path and path.startswith(WORKDIR) else path
    if result in REPLACE_MOUNTS:
        result = REPLACE_MOUNTS[result]
    return result


print('Preprocessing config')
for service in cfg.services:
    print(f'\tPreprocessing service: {service["name"]}')
    if 'build' in service:
        service.pop('build')

    for i, volume in enumerate(service['volumes']):
        service['volumes'][i] = volume._replace(
            internal=relativize(volume.internal),
            external=relativize(volume.external)
        )


print(f'Writing composer file')
with open(os.path.join(OUTPUT_DIR, 'docker-compose.yml'), 'w') as f:
    f.write(serialize_config(cfg, None, False))

copyfile(
    os.path.join(WORKDIR, './rendertron-config.json'),
    os.path.join(OUTPUT_DIR, './rendertron-config.json'),
)

copyfile(
    os.path.join(WORKDIR, './.env.example'),
    os.path.join(OUTPUT_DIR, './.env.example'),
)
