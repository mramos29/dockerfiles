# Docker file to build a Graphite and Grafana server
# Work in progress...
FROM ubuntu:latest

MAINTAINER Marco Ramos <mramos29@sapo.pt> @mramos29

USER root

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get -y update
RUN apt-get install -y apache2 libapache2-mod-wsgi wget

# Add conf here
WORKDIR /tmp
RUN wget https://github.com/graphite-project/graphite-web/archive/0.9.14.tar.gz && tar xvfz 0.9.14.tar.gz && rm 0.9.14.tar.gz
RUN wget https://github.com/graphite-project/carbon/archive/0.9.14.tar.gz && tar xvfz 0.9.14.tar.gz && rm 0.9.14.tar.gz
RUN wget https://github.com/graphite-project/whisper/archive/0.9.14.tar.gz && tar xvfz 0.9.14.tar.gz && rm 0.9.14.tar.gz
