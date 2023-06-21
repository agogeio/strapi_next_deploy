#!/bin/bash

config_file=$1

cp $config_file /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/$config_file /etc/nginx/sites-enabled/