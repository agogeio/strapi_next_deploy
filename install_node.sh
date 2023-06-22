#!/bin/bash

cd ~
curl -sL https://deb.nodesource.com/setup_18.x -o /tmp/nodesource_setup.sh
bash /tmp/nodesource_setup.sh
apt install nodejs -y
npm install pm2@latest -g
pm2 startup systemd