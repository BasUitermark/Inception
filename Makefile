all: up

up:
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

build:
	docker-compose -f ./srcs/docker-compose.yml build

clean:
	docker-compose -f srcs/docker-compose.yml down --volumes

rebuild: clean build

status:
	@docker ps

.PHONY: all up down stop build clean rebuild status
