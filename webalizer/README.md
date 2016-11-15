# Webalizer

This is a Dockerfile to install a simple Webalizer server (yeah, don't ask :))

To build docker image, just type on the current directory:

	docker build -t mramos29/webalizer .

To get this docker image running, just type:

	docker run -p 80:80 -v /path/to/logs:/var/log/apache -t mramos29/webalizer

This will launch Apache on the default port (TCP 80) running on supervisord. It'll mount local /path/to/logs on Docker's /var/log/apache directory.
