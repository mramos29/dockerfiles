# CentOS + Apache + PHP

This is a Dockerfile to install Apache latest version and PHP 5.6.16 on a CentOS base.
mssql and freetds extensions are also installed.
wkhtmltopdf latest version is also installed

To build docker image, just type on the current directory:

	docker build -t centos .

To get this docker image running, just type:

	docker run -p 80:80 -t centos

This will launc Apache on the default port (TCP 80) running on supervisord.
