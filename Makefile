all: dup

dup:
	docker compose -f ./srcs/docker-compose.yml up -d

up:
	docker compose -f ./srcs/docker-compose.yml up --build

sup:
	docker compose -f ./srcs/docker-compose.yml $(s) up --build

down:
	docker compose -f ./srcs/docker-compose.yml down -v

re: down dup

me: down up

run:
	docker exec -it $(s) bash

rmall:
	docker container rm $(shell docker container ls -aq)
	docker image rm $(shell docker image ls -aq)
	docker volume rm $(shell docker volume ls -q)

debian:
	docker run -it --rm debian:bookworm sh