# Docker file to build a Graphite and Grafana server
# Work in progress...
FROM ubuntu:latest

MAINTAINER Marco Ramos <mramos29@sapo.pt> @mramos29

USER root

# apt-get essential packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update
RUN apt-get install -y apache2 apache2-mpm-prefork apache2-utils libexpat1 ssl-cert libapache2-mod-python libapache2-mod-wsgi git python-django python-cairo python-django-tagging python-ldap python-memcache python-txamqp python-setuptools python-dev libapr1 bzr wget

# Download Graphite, Carbon and Whisper source code in order to use latest version since repos take some time to be updated
WORKDIR /tmp
RUN wget https://github.com/graphite-project/graphite-web/archive/0.9.14.tar.gz && \
  tar xvfz 0.9.14.tar.gz && \
  rm 0.9.14.tar.gz
RUN wget https://github.com/graphite-project/carbon/archive/0.9.14.tar.gz && \
  tar xvfz 0.9.14.tar.gz && \
  rm 0.9.14.tar.gz
RUN wget https://github.com/graphite-project/whisper/archive/0.9.14.tar.gz && \
  tar xvfz 0.9.14.tar.gz && \
  rm 0.9.14.tar.gz

# Install Whisper
WORKDIR /tmp/whisper-0.9.14
RUN python setup.py install

# Install Carbon
WORKDIR /tmp/carbon-0.9.14
RUN python setup.py install 

# Install Graphite
WORKDIR /opt/graphite/conf
RUN cp carbon.conf.example carbon.conf && \
  cp storage-schemas.conf.example storage-schemas.conf
WORKDIR /tmp/graphite-web-0.9.14
RUN python setup.py install
WORKDIR /opt/graphite/webapp/graphite
RUN python manage.py syncdb --noinput && \
  cp local_settings.py.example local_settings.py

# Configure Apache
COPY graphite-apache.conf /etc/apache2/sites-available/
RUN a2ensite graphite-apache

# Launch services
EXPOSE 80
EXPOSE 2003
CMD service apache2 start && service carbon start
