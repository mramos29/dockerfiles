# CentOS + Apache + PHP

This is a Dockerfile to install Apache latest version and PHP 5.6.16 on a CentOS base.
mssql and freetds extensions are also installed.
wkhtmltopdf latest version is also installed.

To build docker image, just type on the current directory:

	docker build -t mramos29/centos-apache-php-mssql .

To get this docker image running, just type:

	docker run -p 80:80 -t mramos29/centos-apache-php-mssql

This will launch Apache on the default port (TCP 80) running on supervisord.

Version 1.1:
 - Added PHP Xdebug
 - Enabled mod_rewrite
 - Enabled PHP Error Log
 - Installed MySQL server in the container
