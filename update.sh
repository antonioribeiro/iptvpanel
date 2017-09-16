#!/bin/bash
############################################################
# Update all
#   bash /usr/src/iptvpanel/update.sh 
############################################################
cd /usr/src/iptvpanel/
git pull
cp -a /usr/src/iptvpanel/* /usr/local/nginx/html/
cp /usr/src/iptvpanel/nginx.conf /usr/local/nginx/conf/nginx.conf
composer install -d /usr/local/nginx/html/
killall nginx
/usr/local/nginx/sbin/nginx
sudo service php7.0-fpm restart
