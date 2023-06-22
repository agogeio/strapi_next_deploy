#!/bin/bash

domain=$1
www=www.$domain
email=admin@$domain

echo "Getting certificates for "$domain" and "$www
echo $domain
echo $www
echo $email

certbot run --nginx -n -m $email -d $domain -d $www
