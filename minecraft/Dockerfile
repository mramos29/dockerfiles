# Docker file to build a Magento server (Community Edition)
# Uses Apache2+PHP5 on a Ubuntu 16.04 server

FROM ubuntu:16.04

MAINTAINER Marco Ramos <mramos29@sapo.pt> @mramos29

USER root

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update

# Install Apache, PHP and its modules
RUN apt-get -y install default-jre wget zip

# Install Minecraft
RUN mkdir -p /minecraft && \ 
  cd /minecraft && \
  wget https://s3.amazonaws.com/Minecraft.Download/versions/1.10.2/minecraft_server.1.10.2.jar && \
  echo "eula=true" > /minecraft/eula.txt

# Instll Multicraft
#RUN wget http://www.multicraft.org/download/linux64 -O multicraft.tar.gz && \ 
#  tar xvzf multicraft.tar.gz && \
#  cd multicraft

# Install and configure supervidord
RUN apt-get -y install supervisor
COPY supervisord.conf /etc/supervisord.conf

# Launch services
#EXPOSE 25565
#CMD ["/bin/sh -c supervisord","--configuration=/etc/supervisord.conf"]
