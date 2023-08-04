name = docker
all:
	@docker-compose -f ./srcs/docker-compose.yml up

build:
	@docker-compose -f ./srcs/docker-compose.yml build

stop:
	@docker-compose -f ./srcs/docker-compose.yml stop

down:
	@docker-compose -f ./srcs/docker-compose.yml down

re:	down
	@docker-compose -f ./srcs/docker-compose.yml up  --build

clean: down
	@docker system prune -a

fclean:
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker volume rm srcs_dba srcs_wrd
	@./srcs/requirements/tools/script.sh