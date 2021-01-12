#!make
DC_CONFIGS = -f docker-compose.yml -f seosnap-cacheserver/docker-compose.yml -f seosnap-cachewarmer/docker-compose.yml -f seosnap-dashboard/docker-compose.yml
DC_CONFIGS_DEV = -f docker-compose.yml -f seosnap-cacheserver/docker-compose.dev.yml -f seosnap-cachewarmer/docker-compose.dev.yml -f seosnap-dashboard/docker-compose.dev.yml


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
	docker-compose ${DC_CONFIGS} -f docker-compose.yml run cachewarmer ${A}

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
