# Graphite

This is a Dockerfile to install both Graphite and Grafana running on an Nginx server

It will install Graphite latest version using pip.

To build docker image, just type on the current directory:

	docker build -t mramos29/graphite .

To get this docker image running, just type:

	docker run -t mramos29/graphtie -p 80:80 -p 2003:2003 -d

This will launch nginx and carbon on the default ports (80 and 2003, respectively).
