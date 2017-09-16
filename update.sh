#!/bin/bash
############################################################
# Update all
#   bash /usr/src/iptvpanel/update.sh 
############################################################
echo "Updating"

echo "CD into /usr/src/iptvpanel/"
cd /usr/src/iptvpanel/

echo "Git pull"
git pull

echo "Copy files to /html"
cp -a /usr/src/iptvpanel/* /usr/local/nginx/html/

echo "Copy nginx conf"
cp /usr/src/iptvpanel/nginx.conf /usr/local/nginx/conf/nginx.conf

echo "Composer install stuff"
composer install -d /usr/local/nginx/html/

echo "Restart NGINX"
killall nginx
/usr/local/nginx/sbin/nginx

echo "Restart PHP"
sudo service php7.0-fpm restart
