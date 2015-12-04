# Docker file to build a CentOS LAMP Stack
# (CentOS and Apache latest versions, PHP 5.6.16, mssql, freetds and wktmltopdf)

FROM centos:latest

MAINTAINER Marco Ramos <mramos29@sapo.pt> @mramos29

# Install essential pakages
RUN yum -y install python python-setuptools python-pip bzip2-devel curl curl-devel libjpeg-devel libpng-devel freetype-devel libc-client-devel.i686 libc-client-devel libmcrypt-devel openssl build-essential xorg git-core git-doc libssl-dev urw-fonts libXext libXrender fontconfig libfontconfig.so.1

# Install Apache latest version, PHP 5.6.16 and all the dependencies needed
RUN yum -y install epel*
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN yum -y --enablerepo=remi,remi-php56 install httpd php php-common php-curl php-ldap php-xml php-pecl-apc php-mssql php-freetds

# Install wkhtmltopdf and its dependencies
RUN yum install -y xorg-x11-fonts-75dpi xorg-x11-fonts-Type1
RUN rpm -Uvh http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-centos7-amd64.rpm

# Configure freetds
COPY freetds.conf /etc/freetds.conf

# Configure supervisord
RUN easy_install supervisor
COPY supervisord.conf /etc/supervisord.conf

# Launch services
EXPOSE 80
CMD ["supervisord","--configuration=/etc/supervisord.conf"]
