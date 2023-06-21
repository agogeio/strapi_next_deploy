#!/bin/bash

usertoadd=$1
frontend=nextjs
backend=strapi

mkdir /home/$usertoadd/$backend
chown $usertoadd:$usertoadd /home/$usertoadd/$backend

mkdir /home/$usertoadd/$frontend
chown $usertoadd:$usertoadd /home/$usertoadd/$frontend