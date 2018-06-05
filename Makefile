SAMPLES_DIR = /srv/laboratorio/data
RULES_DIR = `pwd`/rules/

build:
	@if [ ! -f .env ]; then \
		echo "SAMPLES_DIR=$(SAMPLES_DIR)" > .env; \
		echo "RULES_DIR=$(RULES_DIR)" >> .env; \
	fi
	@docker-compose build

clean:
	@docker-compose stop
	@docker-compose rm -f -v

up: build
	@docker-compose up -d
	@docker exec -it threathunter_yara_1 bash

update:
	@git submodule foreach git pull
