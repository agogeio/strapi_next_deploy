#!/bin/bash

domain=$1
www=www.$domain

echo "Getting certificates for "$domain" and "$www
echo $domain
echo $www
certbot run --nginx -d $domain -d $www