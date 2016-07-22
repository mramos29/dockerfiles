# Dockerfile for Magento (Ubuntu and Apache+PHP)

This is a Dockerfile to install Magento 2 on an Apache+PHP server running on a Ubuntu 16.04.

To build docker image, just type on the current directory:

	docker build -t mramos29/magento .

To get this docker image running, just type:

	docker run -p 80:80 -d -t mramos29/magento

This will launch Apache on the default port (TCP 80) running on supervisord.
