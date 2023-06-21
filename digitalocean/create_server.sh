#!/bin/bash

TOKEN=$1

curl -X POST -H 'Content-Type: application/json' \
    -H 'Authorization: Bearer '$TOKEN'' \
    -d '{"name":"agogeio-test-ooi",
        "size":"s-1vcpu-2gb-intel",
        "region":"nyc1",
        "image":"ubuntu-22-10-x64",
        "vpc_uuid":"9676d677-a65c-455d-9383-c0677899c26b",
        "user_data":"#!/bin/bash\n\ncd /root\ncurl https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/system_config.py -o system_config.py\n\ncurl https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/create_hosting_dir.sh -o create_hosting_dir.sh\ncurl https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/install_base.sh -o install_base.sh\ncurl https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/install_nginx.sh -o install_nginx.sh\ncurl https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/install_node.sh -o install_node.sh\ncurl https://raw.githubusercontent.com/agogeio/strapi_next_deploy/main/set_ufw.sh -o set_ufw.sh"}' \
    "https://api.digitalocean.com/v2/droplets"