#!make
.PHONY: all release

DC_CONFIGS = -f docker-compose.yml -f seosnap-cachewarmer/docker-compose.yml -f seosnap-dashboard/docker-compose.yml
DC_CONFIGS_DEV = -f docker-compose.yml -f seosnap-cachewarmer/docker-compose.dev.yml -f seosnap-dashboard/docker-compose.dev.yml


up:
	docker-compose ${DC_CONFIGS} -f docker-compose.yml up

down:
	docker-compose ${DC_CONFIGS} -f docker-compose.yml down

daemon:
	docker-compose ${DC_CONFIGS} -f docker-compose.yml up -d

build:
	docker-compose ${DC_CONFIGS} -f docker-compose.yml build

dc:
	docker-compose ${DC_CONFIGS} -f docker-compose.yml ${A}

warm:
	docker-compose ${DC_CONFIGS} -f docker-compose.yml run --rm --name cachewarmer_full cachewarmer ${A}

thread:
	docker-compose ${DC_CONFIGS} -f docker-compose.yml run -d --rm cachewarmer ${A}
	docker-compose ${DC_CONFIGS} -f docker-compose.yml run -d --rm cachewarmer ${A}
	docker-compose ${DC_CONFIGS} -f docker-compose.yml run -d --rm cachewarmer ${A}
#	docker-compose ${DC_CONFIGS} -f docker-compose.yml run -d --rm cachewarmer ${A}
#	docker-compose ${DC_CONFIGS} -f docker-compose.yml run -d --rm cachewarmer ${A}

queue:
	docker-compose ${DC_CONFIGS} -f docker-compose.yml run --rm --name cachewarmer_queue cachewarmer ${A}

install:
	echo 'Running installation'
	cp .env.example .env
	sh seosnap-dashboard/dev/commands/install.sh

update:
	git submodule update --init --recursive
	git submodule foreach --recursive git fetch origin master
	git submodule foreach --recursive git checkout master
	echo "Everything is now up to date"

develop:
	git submodule update --init --recursive
	git submodule foreach --recursive git fetch origin develop
	git submodule foreach --recursive git checkout develop
	echo "Everything is now up to date"


release:
	python dev/scripts/release_config.py --configs docker-compose.yml seosnap-cachewarmer/docker-compose.yml seosnap-dashboard/docker-compose.yml docker-compose.yml
	rm -rf release/cache release/logs
	rm -f release/release.zip
	cd release && zip release.zip * .env.example
