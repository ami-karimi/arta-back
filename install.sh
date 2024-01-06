#!/bin/bash
printarta() {
    text="$1"
    delay="$2"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep $delay
    done
    echo
}
function isRoot() {
        if [ "$EUID" -ne 0 ]; then
                return 1
        fi
}
if ! isRoot; then
        echo "Sorry, you need to run this as root"
        exit 1
fi

sudo apt update -y
wait
sudo apt upgrade -y
wait

clear
echo ""
printarta "ArtaPanel Instalation" 0.1
sudo apt -y install software-properties-common
sudo add-apt-repository ppa:ondrej/php -y
sudo apt install -y php8.1 libapache2-mod-php8.1 php8.1-common php8.1-bcmath  php8.1-curl  php8.1-dom  ph>
apt install -y git  apache2 zip unzip net-tools curl
sudo systemctl restart apache2
clear
printarta "Install qrencode" 0.1
apt install -y qrencode
clear
printarta "Install Composer" 0.1
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
echo $HASH
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
clear

sudo apt install mysql-server -y
sudo systemctl start mysql.service
mysql -e "create database radius;" &
wait
mysql -e "CREATE USER 'radius'@'%'  IDENTIFIED BY  'radpass';" &
wait
mysql -e "GRANT ALL ON *.* TO 'radius'@'localhost';" &
wait
mysql "radius" < "sql.sql"
wait
sudo timedatectl set-timezone Asia/Tehran
wget https://files.phpmyadmin.net/phpMyAdmin/5.1.1/phpMyAdmin-5.1.1-all-languages.zip
unzip phpMyAdmin-5.1.1-all-languages.zip
mv phpMyAdmin-5.1.1-all-languages /usr/share/phpmyadmin
mkdir /usr/share/phpmyadmin/tmp
chown -R www-data:www-data /usr/share/phpmyadmin
chmod 777 /usr/share/phpmyadmin/tmp
sudo a2enconf phpmyadmin
a2enmod php8.1
sudo update-alternatives --set php /usr/bin/php8.1
sudo update-alternatives --set phar /usr/bin/phar8.1
sudo update-alternatives --set phar.phar /usr/bin/phar.phar8.1
sudo update-alternatives --set php-config /usr/bin/php-config8.1
echo 'Include /etc/phpmyadmin/apache.conf' >> /etc/apache2/apache2.conf
sudo systemctl restart apache2
wait

sudo phpenmod mbstring
sudo systemctl restart apache2
clear
printarta "Install composer Data" 0.1

composer install

wait

printarta "Install Freeradius" 0.1
apt-get install -y freeradius


service freeradius start

apt-get install -y freeradius-mysql
service freeradius start

apt-get install -y freeradius-mysql

service freeradius stop
wait
ln -s /etc/freeradius/3.0/mods-available/sql /etc/freeradius/3.0/mods-enabled/sql
wait
ln -s /etc/freeradius/3.0/sites-available/dynamic-clients /etc/freeradius/3.0/sites-enabled/dynamic-clients
wait
sh /etc/freeradius/3.0/certs/bootstrap
wait
chown -R freerad:freerad /etc/freeradius/3.0/certs
wait
service freeradius stop
sudo php artisan install:radius
service freeradius start
