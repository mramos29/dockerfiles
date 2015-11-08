# Docker file to build a BZFlag server
# Work in progress...
FROM ubuntu:latest

MAINTAINER Marco Ramos <mramos29@sapo.pt> @mramos29

USER root

RUN apt-get -y update
RUN apt-get -y install bzflag-server

# Add conf here

WORKDIR /usr/games

# Add environment variables

CMD ["./bzfs", "'-a 50 38']
