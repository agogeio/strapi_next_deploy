#!/bin/bash

domain=$1

certbot run --nginx -d $domain -d www.$domain