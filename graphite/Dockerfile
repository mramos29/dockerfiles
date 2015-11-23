# Docker file to build a Graphite and Grafana server
FROM ubuntu:14.04

MAINTAINER Marco Ramos <mramos29@sapo.pt> @mramos29

# apt-get essential packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get -y update
RUN apt-get install -y nginx libexpat1 ssl-cert python-ldap python-cairo python-django python-twisted python-django-tagging python-simplejson python-pyparsing python-memcache python-pysqlite2 python-support python-pip python-dev gunicorn nodejs git supervisor

# Install pytz
RUN pip install pytz

# Install Whisper, Carbon and Graphite using pip 
RUN pip install whisper
RUN pip install carbon
RUN pip install graphite-web

# Configure stuff 
RUN mkdir -p /opt/graphite/storage/whisper && \
  chmod 0755 /opt/graphite/storage && \
  chmod 0755 /opt/graphite/storage/whisper
RUN touch /opt/graphite/storage/graphite.db && \ 
  touch /opt/graphite/storage/index && \
  chmod 0664 /opt/graphite/storage/graphite.db
WORKDIR /opt/graphite/webapp/graphite
RUN python manage.py syncdb --noinput && \
  cp local_settings.py.example local_settings.py && \ 
  chown -R www-data:www-data /opt/graphite
WORKDIR /opt/graphite/conf
RUN cp carbon.conf.example carbon.conf && \
  cp storage-schemas.conf.example storage-schemas.conf && \
  cp graphite.wsgi.example graphite.wsgi

# Install nodejs and statsd
WORKDIR /opt
RUN git clone git://github.com/etsy/statsd.git
COPY localConfig.js /opt/statsd/localConfig.js

# Configure Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Configure supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Launch services
EXPOSE 80 2003 8125/udp 8126
CMD ["/usr/bin/supervisord"]
