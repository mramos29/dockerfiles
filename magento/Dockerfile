# Docker file to build a Magento server

FROM ubuntu:16.04

MAINTAINER Marco Ramos <mramos29@sapo.pt> @mramos29

USER root

RUN apt-get -y update

# Install Apache, PHP and its modules
RUN apt-get -y install apache2 php libapache2-mod-php php-mcrypt php-mysql php-curl php-gd mysql-client

# Install Magento

# Install and configure supervidord
RUN apt-get -y install supervisor
COPY supervisord.conf /etc/supervisord.conf

# Launch services
EXPOSE 80
CMD ["supervisord","--configuration=/etc/supervisord.conf"]
