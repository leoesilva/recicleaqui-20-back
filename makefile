DOCKER_COMPOSE_FILE = $(shell echo -f docker-compose.yml -f docker-compose.override.dev.yml)
ARGS = $(filter-out $@,$(MAKECMDGOALS))

up:
	docker compose ${DOCKER_COMPOSE_FILE} up -d
build: stop
	docker compose ${DOCKER_COMPOSE_FILE} build
stop:
	docker compose ${DOCKER_COMPOSE_FILE} stop
init: build up
rebuild: build up

logs:
	docker compose ${DOCKER_COMPOSE_FILE} logs ${ARGS} -f
sh:
	docker compose ${DOCKER_COMPOSE_FILE} exec ${ARGS} bash