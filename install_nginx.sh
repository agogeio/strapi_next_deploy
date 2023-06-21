#!/bin/bash

source_path=
config_path=etc/nginx/conf.d/upstream.conf

apt install nginx -y
systemctl enable nginx

curl -sL $source_path -o $config_path