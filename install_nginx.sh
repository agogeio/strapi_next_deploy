#!/bin/bash

domain=$1

source_path=https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/nginx_config/conf.d/upstream.conf
config_path=/etc/nginx/conf.d/upstream.conf

mkdir -p /var/www/$domain/html

echo "Odin 2024, no more frost giants" >> /var/www/$domain/html/index.html

apt install nginx -y
systemctl enable nginx

curl -sL $source_path -o $config_path