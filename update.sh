#!/bin/bash
####################
##### Update all
####################
git pull /usr/src/iptvpanel/
cp -a /usr/src/iptvpanel/* /usr/local/nginx/html/
cp /usr/src/iptvpanel/nginx.conf /usr/local/nginx/conf/nginx.conf
composer install -d /usr/local/nginx/html/
killall nginx
/usr/local/nginx/sbin/nginx
