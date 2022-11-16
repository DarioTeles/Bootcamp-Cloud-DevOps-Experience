#!/bin/bash

echo "Atualizando o servidor..."
apt update
apt upgrade -y

echo "Instalando o Apache..."
apt install apache2 -y

echo "Instalando o Unzip..." 
apt install unzip -y

echo "Baixando e movendo os arquivos do site..."
cd /temp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cp linux-site-dio-main/* /var/www/html/
