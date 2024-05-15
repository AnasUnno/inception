all : up

up : 
	@docker-compose -f ./srcs/docker-compose.yaml up

down : 
	@docker-compose -f ./srcs/docker-compose.yaml down

stop : 
	@docker-compose -f ./srcs/docker-compose.yaml stop

start :
	@docker-compose -f ./srcs/docker-compose.yaml start
