# Docker file to build a Magento server

FROM ubuntu:16.04

MAINTAINER Marco Ramos <mramos29@sapo.pt> @mramos29

USER root

RUN apt-get -y update
RUN apt-get -y install apache2 php libapache2-mod-php php-mcrypt php-mysql php-curl php-gd mysql-client
# php5 libcurl3 php5-curl php5-gd
