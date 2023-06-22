#!/bin/bash

domain=$1
www=www.$domain
email=sma92878@gmail.com

echo "Getting certificates for "$domain" and "$www
echo $domain
echo $www
echo $email

certbot run --agree-tos --nginx -n -m $email -d $domain -d $www
