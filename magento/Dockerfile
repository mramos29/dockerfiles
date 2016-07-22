# Docker file to build a Magento server (Community Edition)
# Uses Apache2+PHP5 on a Ubuntu 16.04 server

FROM ubuntu:16.04

MAINTAINER Marco Ramos <mramos29@sapo.pt> @mramos29

USER root

RUN apt-get -y update

# Install Apache, PHP and its modules
RUN apt-get -y install apache2 php libapache2-mod-php php-mcrypt php-mysql php-curl php-gd mysql-client php-pear vim curl
RUN a2enmod rewrite

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && \
  mv composer.phar /usr/local/bin/composer

# Install and configure supervidord
RUN apt-get -y install supervisor
COPY supervisord.conf /etc/supervisord.conf

# Launch services
EXPOSE 80
CMD ["supervisord","--configuration=/etc/supervisord.conf"]
