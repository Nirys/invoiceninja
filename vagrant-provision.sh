#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive
#export LANGUAGE=en_US.UTF-8
#export LANG=en_US.UTF-8
#export LC_ALL=en_US.UTF-8
#locale-gen en_US.UTF-8
#dpkg-reconfigure locales

sudo rm /etc/apt/sources.list.d/mongodb*.list

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -

# PHP 7 repo
sudo add-apt-repository -y ppa:ondrej/php
# PHP 7 repo

sudo apt-get update

sudo apt-get remove -y -q php7.0*

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y -q nodejs
sudo apt-get install -y -q npm
npm install npm@latest -g
npm install cross-env -D --no-bin-links
npm install node-sass -g
npm install sass -g
npm install less -g
#sudo apt-get install -y -q nginx
sudo apt-get install -y -q php7.3-gmp
sudo apt-get install -y -q php7.3-xdebug
sudo service apache2 restart


mysql -uroot -proot -e "SET PASSWORD = PASSWORD('');"

mysql -uroot -e "CREATE DATABASE ninja CHARACTER SET utf8 COLLATE utf8_general_ci;"
mysql -uroot -e "CREATE USER 'ninja_user'@'%' IDENTIFIED BY 's3cr3t';";
mysql -uroot -e "GRANT ALL ON ninja.* TO 'ninja_user'@'%';";
mysql -uroot -e "FLUSH PRIVILEGES;";


# Install composer
sudo apt-get install -y -q curl git
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer