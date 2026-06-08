#check if docker compose or docker-compose
DOCKER_COMPOSE:=$(shell which docker-compose || echo 'docker compose')
RCLONE:=$(shell which rclone)

.PHONY: all
all: build

.PHONY: build
build:
	BUILDKIT_PROGRESS=plain docker build . -t docker-rsync-ofelia

.PHONY: info
info:
	@echo "make info: shows this message"
	@echo "make or make build: builds image"
	@echo "make shell: runs a shell inside the container for testing purposes."
	@echo "make config-files: generate needed files."
	@echo "make run: run the container."
	@echo "make run-dettached: run the container in the background."
	@echo "make logs or make log: Show container logs and follow."
	@echo "make stop: stop container."

.PHONY: shell
shell:
	$(DOCKER_COMPOSE) run -it docker-rsync-ofelia /bin/ash

.PHONY: config-files
config-files:
	cp ofelia_config.ini.example ofelia_config.ini
	touch known_hosts

.PHONY: run
run:
	$(DOCKER_COMPOSE) up

.PHONY: run-dettached
run-dettached:
	$(DOCKER_COMPOSE) up -d

.PHONY: log
log:
	$(DOCKER_COMPOSE) log -f

.PHONY: stop
stop:
	$(DOCKER_COMPOSE) stop
