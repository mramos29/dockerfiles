# Docker file to build a Graphite and Grafana server
FROM ubuntu:latest

MAINTAINER Marco Ramos <mramos29@sapo.pt> @mramos29

#USER root

# apt-get essential packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y update
RUN apt-get install -y apache2 apache2-mpm-prefork apache2-utils libexpat1 ssl-cert libapache2-mod-python libapache2-mod-wsgi python-ldap python-cairo python-django python-twisted python-django-tagging python-simplejson python-memcache python-pysqlite2 python-support python-pip gunicorn supervisor supervisor

# Install Whisper, Carbon and Graphite using pip 
RUN pip install whisper
RUN pip install carbon
RUN pip install graphite-web

# Configure stuff 
WORKDIR /opt/graphite/webapp/graphite
RUN python manage.py syncdb --noinput && \
  cp local_settings.py.example local_settings.py
WORKDIR /opt/graphite/conf
RUN cp carbon.conf.example carbon.conf && \
  cp storage-schemas.conf.example storage-schemas.conf && \
  cp graphite.wsgi.example graphite.wsgi

# Configure Apache
COPY graphite-apache.conf /etc/apache2/sites-available/
RUN a2dissite 000-default
RUN a2ensite graphite-apache

# Configure supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Launch services
EXPOSE 80 2003
CMD ["/usr/bin/supervisord"]
