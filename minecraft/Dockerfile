# Docker file to build a Magento server (Community Edition)
# Uses Apache2+PHP5 on a Ubuntu 16.04 server

FROM ubuntu:16.04

MAINTAINER Marco Ramos <mramos29@sapo.pt> @mramos29

USER root

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update

# Install JRE, Apache, PHP and the basic stuff
RUN apt-get -y install default-jre apache2 php libapache2-mod-php php-mysql php-curl php-gd php-zip mysql-client php-pear wget zip vim
RUN a2enmod rewrite
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Install Minecraft
RUN mkdir -p /minecraft && \ 
  cd /minecraft && \
  wget https://s3.amazonaws.com/Minecraft.Download/versions/1.10.2/minecraft_server.1.10.2.jar && \
  echo "eula=true" > /minecraft/eula.txt

# Install Multicraft
RUN cd /var/www/html/ && \
  wget http://www.multicraft.org/download?arch=linux64 -O multicraft.tgz && \
  tar xvfz multicraft.tgz 

# Instll Multicraft
#RUN wget http://www.multicraft.org/download/linux64 -O multicraft.tar.gz && \ 
#  tar xvzf multicraft.tar.gz && \
#  cd multicraft

# Install and configure supervidord
RUN apt-get -y install supervisor
COPY supervisord.conf /etc/supervisord.conf
COPY start_minecraft.sh /start_minecraft.sh

# Launch services
EXPOSE 80 25565
CMD ["./start_minecraft.sh"]
#CMD ["/bin/sh -c supervisord","--configuration=/etc/supervisord.conf"]
