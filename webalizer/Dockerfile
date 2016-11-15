FROM ubuntu:16.04
MAINTAINER Marco Ramos <@mramos29>

RUN apt-get update
RUN apt-get install -y apache2 git curl vim webalizer supervisor
RUN mv /var/www/webalizer /var/www/html

EXPOSE 80

COPY webalizer.conf /etc/webalizer/webalizer.conf
COPY supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord","--configuration=/etc/supervisord.conf"]
