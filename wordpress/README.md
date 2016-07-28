# yml for docker-composer to build a Wordpress stack

This is a yml file for docker-composer to build 2 containers with the official images of wordpress and mariadb.

To start the containers, type the following on the yml directory:

	docker-compose up -d

To stop the containers: 

	docker-compose down

html directory will be available on the host machine on /volumes/html and mariadb/MySQL data will be available on host machine on /volumes/data. 
