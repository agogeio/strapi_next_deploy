#!/bin/bash

# curl https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/boot.sh -o boot.sh
# chmod +x boot.sh
# ./boot.sh

cd /root
curl https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/system_config.py -o system_config.py

curl https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/create_hosting_dir.sh -o create_hosting_dir.sh
curl https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/install_base.sh -o install_base.sh
curl https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/install_nginx.sh -o install_nginx.sh
curl https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/install_node.sh -o install_node.sh
curl https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/set_ufw.sh -o set_ufw.sh
curl https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/set_nginx.sh -o set_nginx.sh
curl https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/set_certbot.sh -o set_certbot.sh
curl https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/set_ufw.sh -o set_ufw.sh

curl https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/nginx_config/sites-available/domain.template -o domain.template

python3 system_config.py