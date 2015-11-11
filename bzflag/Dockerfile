# Docker file to build a BZFlag server
# Work in progress...
FROM ubuntu:14.04

MAINTAINER Marco Ramos <mramos29@sapo.pt> @mramos29

USER root

RUN apt-get -y update
RUN apt-get -y install bzflag-server

WORKDIR /usr/games

CMD ["./bzfs"]
