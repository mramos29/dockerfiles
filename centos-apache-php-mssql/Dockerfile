# Docker file to build a CentOS LAMP Stack
# (CentOS and Apache latest versions, PHP 5.6.16, mssql, freetds and wktmltopdf)

FROM centos:latest

MAINTAINER Marco Ramos <mramos29@sapo.pt>

# Install essential pakages
RUN yum -y install python python-setuptools python-pip bzip2-devel curl curl-devel libjpeg-devel libpng-devel freetype-devel libc-client-devel.i686 libc-client-devel libmcrypt-devel openssl build-essential xorg git-core git-doc libssl-dev urw-fonts libXext libXrender fontconfig libfontconfig.so.1 gcc gcc-c++ autoconf automake

# Install Apache latest version, PHP 5.6.16 and all the dependencies needed
RUN yum -y install epel*
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum -y --enablerepo=remi,remi-php56 install httpd php php-common php-curl php-ldap php-xml php-pecl-apc php-mssql php-freetds php-devel php-pear

# Install and enabe PHP Xdebug, enable PHP Error Log and mod_rewrite
RUN pecl install xdebug
RUN mkdir -p /var/log/php && touch /var/log/php/php-errors.log && chown -R apache:apache /var/log/php
COPY php.ini /etc/php.ini
COPY httpd.conf /etc/httpd/conf/httpd.conf

# Install wkhtmltopdf and its dependencies
RUN yum install -y xorg-x11-fonts-75dpi xorg-x11-fonts-Type1
RUN rpm -Uvh http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-centos7-amd64.rpm

# Configure freetds
COPY freetds.conf /etc/freetds.conf

# Install MySQL
RUN rpm -ivh http://repo.mysql.com/mysql-community-release-el7-5.noarch.rpm
RUN yum -y install mysql-server mysql
COPY mysql-bootstrap.sh /tmp/mysql-bootstrap.sh
RUN /tmp/mysql-bootstrap.sh

# Configure supervisord
RUN easy_install supervisor
COPY supervisord.conf /etc/supervisord.conf

# Launch services
EXPOSE 80 3306
CMD ["supervisord","--configuration=/etc/supervisord.conf"]
