COMPOSE_FILE := ./srcs/docker-compose.yml

# Start all containers
all:
	@docker compose -f $(COMPOSE_FILE) up -d --build

# Stop and remove all containers
down:
	@docker compose -f $(COMPOSE_FILE) down

# Restart all containers
re:
	@docker compose -f srcs/docker-compose.yml up -d --build

# Stop and remove all containers, images, volumes, and networks
clean:
	@docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
