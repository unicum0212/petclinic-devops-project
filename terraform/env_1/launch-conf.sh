#! /bin/bash
apt update
apt install default-jre -y
apt install default-jdk -y
apt install maven -y
apt install dos2unix -y
mkdir /home/ubuntu/app
chmod 777 /home/ubuntu/app