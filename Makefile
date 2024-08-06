DOCKER_IMAGES	=	$(shell docker images -qa)

all:	prepare
	cd srcs && docker-compose up -d --build && cd ..

prepare:
	mkdir -p /home/selkhadr/data/db_data
	mkdir -p /home/selkhadr/data/wp_data

down:
	cd srcs && docker-compose down -v && cd ..
	sudo rm -rf /home/selkhadr/data/db_data /home/selkhadr/data/wp_data

fclean:
	cd srcs && docker-compose down -v && cd ..
	cd srcs && docker image rm -f $(DOCKER_IMAGES) || true && cd ..
	docker system prune
	sudo rm -rf /home/selkhadr/data/db_data /home/selkhadr/data/wp_data

re:	fclean all
                                                                                                                                                                                                                                                                                                            
.PHONY: prepare help all up build down re
