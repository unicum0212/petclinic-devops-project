#! /bin/bash
apt update
apt install default-jre -y
apt install default-jdk -y
apt install maven -y
apt install dos2unix -y
mkdir /home/ubuntu/app
chmod 777 /home/ubuntu/app
apt install apache2 -y
echo Hello > /var/www/html/index.html
systemctl reload apache2