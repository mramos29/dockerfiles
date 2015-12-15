#!/bin/bash
set -e

if [ -z "$(ls -A /var/lib/mysql)" ]; then
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

chown -R mysql:mysql /var/lib/mysql
