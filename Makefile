# Este archivo define comandos útiles para manejar los contenedores Docker.

build:
	docker-compose build

up:
	docker-compose down --remove-orphans
	docker-compose up -d
	docker exec -it AppName /bin/bash

down:
	docker-compose down

logs:
	docker-compose logs
