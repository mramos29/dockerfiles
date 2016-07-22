# Docker file to build a Magento server (Community Edition)
# Uses Apache2+PHP5 on a Ubuntu 16.04 server

FROM ubuntu:16.04

MAINTAINER Marco Ramos <mramos29@sapo.pt> @mramos29

USER root

RUN apt-get -y update

# Install Apache, PHP and its modules
RUN apt-get -y install apache2 php libapache2-mod-php php-mcrypt php-mysql php-curl php-gd mysql-client php-pear git vim curl
RUN a2enmod rewrite
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && \ 
  mv composer.phar /usr/local/bin/composer

# Install Magento Sample Data
#RUN cd /var/www/html && \
#  git clone https://github.com/magento/magento2-sample-data.git magento2 && \
#  cd magento2/dev/tools && \
#  php -f build-sample-data.php -- --ce-source="/var/www/html/magento2"
#RUN cd /var/www/html/magento2 && \
#  chown -R www-data:www-data * && \
#  find . -type d -exec chmod g+ws {} \;

# Install Magento
RUN cd /var/www/html && \ 
  git clone https://github.com/magento/magento2.git && \
  export PATH=$PATH:/var/www/html/magento2/bin
#RUN php /var/www/html/magento2/bin/magento setup:install --base-url=http://127.0.0.1/magento2/ \
#--db-host=localhost --db-name=magento --db-user=magento --db-password=magento \
#--admin-firstname=Magento --admin-lastname=User --admin-email=user@example.com \
#--admin-user=admin --admin-password=admin123 --language=en_US \
#--currency=USD --timezone=America/Chicago --use-rewrites=1
  

# Install and configure supervidord
RUN apt-get -y install supervisor
COPY supervisord.conf /etc/supervisord.conf

# Launch services
EXPOSE 80
CMD ["supervisord","--configuration=/etc/supervisord.conf"]
