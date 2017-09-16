#!/bin/bash
# Tested on Ubuntu Ubuntu 14.04 and 15.04
# feel free to ask me if you have any question sevan@tyfix.nl 
# git clone https://github.com/zgelici/FOS-Streaming.git
# [sudo] bash install.sh

echo "Installing full 64 bits"

echo "## Update and upgrade system"
apt-get --yes update
apt-get --yes upgrade

echo "## Installing needed files"

apt-get install --yes \
    git \
    php7.0 \
    php7.0-cli \
    php7.0-mbstring \
    php7.0-mysql \
    php7.0-fpm \
    apache2 \
	libapache2-mod-php7.0 \
    mysql-server \
    phpmyadmin \
    curl \
    joe \
    links \
    libxml2-dev \
    libbz2-dev \
    libcurl4-openssl-dev \
    libmcrypt-dev \
    libmhash2 \
    libmhash-dev \
    libpcre3 \
    libpcre3-dev \
    make \
    build-essential \
    libxslt1-dev git \
    libssl-dev \
    unzip \
    python-software-properties \
    libpopt0 \
    libpq-dev \
    libpq5 \
    libpspell-dev \
    libpthread-stubs0-dev \
    libpython-stdlib \
    libqdbm-dev \
    libqdbm14 \
    librecode-dev \
    libsnmp-base \
    libsnmp-dev \
    libsnmp-perl \
    libsnmp30 \
    libsqlite3-dev \
    libssh2-1 \
    libssh2-1-dev \
    libssl-dev \
    libstdc++-4.8-dev \
    libstdc++6-4.7-dev \
    libsybdb5 \
    libtasn1-bin \
    libtasn1-3-bin \
    libtasn1-6-dev \
    libterm-readkey-perl \
    libtidy-0.99-0 \
    libtidy-dev \
    libtiff5 \
    libtiff5-dev \
    libtiffxx5 \
    libtimedate-perl \
    libtinfo-dev \
    libtool \
    libunistring0 \
    libvpx-dev \
    libvpx3 \
    libwrap0-dev \
    librecode0 \
    librtmp-dev \
    librtmp1 \
    libsasl2-dev \
    libsasl2-modules \
    libsctp-dev \
    libsctp1 \
    libsensors4 \
    libsensors4-dev \
    libsm-dev \
    libsm6 \
    m4 \
    make \
    man-db \
    netcat-openbsd \
    odbcinst1debian2 \
    openssl \
    patch \
    pkg-config \
    po-debconf \
    python \
    python-minimal \
    python2.7 \
    python2.7-minimal \
    re2c \
    unixodbc \
    unixodbc-dev \
    zlib1g-dev \
    libx11-6 \
    libx11-data \
    libx11-dev \
    libxau-dev \
    libxau6 \
    libxcb1 \
    libxcb1-dev \
    libxdmcp-dev \
    libxdmcp6 \
    libxml2 \
    libxmltok1 \
    libxmltok1-dev \
    libxpm-dev \
    libxpm4 \
    libxslt1-dev \
    libxslt1.1 \
    libxt-dev \
    libxt6 \
    linux-libc-dev \
    libuuid1 \
    x11-common \
    x11proto-core-dev \
    x11proto-input-dev \
    x11proto-kb-dev \
    xorg-sgml-doctools \
    libjpeg8 \
    xtrans-dev \
    zlib1g-dev \
    ffmpeg

echo "## Installing and configuring nginx and the FOS-Streaming panel"
#**************if you already have nginx remove it from this line**************#
cd /usr/src/
git clone https://github.com/arut/nginx-rtmp-module.git
wget http://nginx.org/download/nginx-1.9.2.tar.gz
tar -xzf nginx-1.9.2.tar.gz
cd /usr/src/nginx-1.9.2/
./configure --add-module=/usr/src/nginx-rtmp-module --with-http_ssl_module --with-http_secure_link_module
make && make install
#cp /usr/src/nginx-rtmp-module/stat.xsl /usr/local/nginx
 #**************NGINX INSTALL END LINE**************#
rm -r /usr/local/nginx/conf/nginx.conf
git clone https://github.com/antonioribeiro/iptvpanel.git /usr/src/iptvpanel
cd /usr/src/iptvpanel/
cp /usr/src/iptvpanel/nginx.conf /usr/local/nginx/conf/nginx.conf
cp -a /usr/src/iptvpanel/* /usr/local/nginx/html/
wget https://getcomposer.org/installer -O /usr/src/installer
/usr/bin/php /usr/src/installer
mv composer.phar /usr/local/bin/composer
composer install -d /usr/local/nginx/html/
echo 'www-data ALL = (root) NOPASSWD: /usr/bin/ffmpeg' >> /etc/sudoers
echo 'www-data ALL = (root) NOPASSWD: /usr/bin/ffprobe' >> /etc/sudoers
sed --in-place '/exit 0/d' /etc/rc.local
echo "sleep 10" >> /etc/rc.local
echo "/usr/local/nginx/sbin/nginx" >> /etc/rc.local
echo "exit 0" >> /etc/rc.local

mkdir /usr/local/nginx/html/hl
chmod -R 777 /usr/local/nginx/html/hl
mkdir /usr/local/nginx/html/cache
chmod -R 777 /usr/local/nginx/html/cache
chown www-data:www-data /usr/local/nginx/conf
wget https://raw.github.com/JasonGiedymin/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx
chmod +x /etc/init.d/nginx
update-rc.d nginx defaults

### database import
echo "done"
echo "installation finshed."
echo "go to http://host/phpmyadmin and upload the database.sql file which is located in /usr/local/nginx/html/"
echo "configure /usr/local/nginx/html/config.php"
echo "login: http://host:8000 username: admin - password: admin"
echo "After login go to settings and change web ip port to your public server ip"

# Start nginx
/usr/local/nginx/sbin/nginx

# Restart apache2
service apache2 restart

# Update
cd /usr/src/iptvpanel/
git pull
cp -a /usr/src/iptvpanel/* /usr/local/nginx/html/
composer update -d /usr/local/nginx/html/
