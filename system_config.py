#!/bin/env/python

import crypt
import os
import subprocess

HOSTING_PATH = './create_hosting_dir.sh'

INSTALL_BASE_PACKAGES = './install_base.sh'
INSTALL_NGINX = './install_nginx.sh'
INSTALL_NODE_PACKAGES = './install_node.sh'

SET_NGINX = './set_nginx.sh'
SET_CERTBOT = './set_certbot.sh'

SRC_FILE = './domain.template'
TEMPLATE_DOMAIN = 'domain.template'

name = input("What is the name of the user you would like to create?: ")
username = input("What should the username be?: ")
password = input("What is the unencrypted password you would like to use?: ")
domain = input("What is the domain name to be used?: ")

def create_user(cu_name, cu_username, cu_password) -> None:
    """ Create the user and sets the password on the target system"""
    encrypted_password = crypt.crypt(cu_password,"22")
    return  os.system("useradd -p "+encrypted_password+ " -s "+ "/bin/bash "+ "-d "
                      + "/home/" + cu_username+ " -m "+ " -c \""+ cu_name+"\" " + cu_username)

def add_x_to_file(file_path) -> None:
    """ Add Executable Permissions on a File"""
    print(f'Making file, {file_path} executable')
    result = subprocess.run(['chmod', '+x', file_path],
         capture_output=True, text=True, universal_newlines=True, check=False)
    print(result)

def execute_bash(file_path, user_param = 'None') -> None:
    """ Bash Script to Execute """

    if user_param == 'None':
        print(f"Executing {file_path} parameter: {user_param}")
        execute_result = subprocess.run(file_path, capture_output=True,
                                         text=True, universal_newlines=True, check=False)
        print(execute_result.stdout)
    else:
        print(f"Executing {file_path} parameter: {user_param}")
        execute_result = subprocess.run([file_path, user_param], capture_output=True,
                         text=True, universal_newlines=True, check=False)
        print(execute_result.stdout)

try:
    create_user(name, username, password)
except Exception as e:
    print(e)
    exit(1)


add_x_to_file(HOSTING_PATH)
add_x_to_file(INSTALL_BASE_PACKAGES)
add_x_to_file(INSTALL_NODE_PACKAGES)
add_x_to_file(INSTALL_NGINX)
add_x_to_file(SET_NGINX)
add_x_to_file(SET_CERTBOT)


execute_bash(HOSTING_PATH, username)
execute_bash(INSTALL_BASE_PACKAGES)
execute_bash(INSTALL_NODE_PACKAGES)
execute_bash(INSTALL_NGINX, domain)


with open(SRC_FILE, 'r', encoding='utf-8') as file:
    content = file.read()

# Replace the specific text
modified_content = content.replace(TEMPLATE_DOMAIN, domain)

# Open the file in write mode and write the modified contents
with open(f'./{domain}', 'w', encoding='utf-8') as file:
    file.write(modified_content)

execute_bash(SET_NGINX, domain)
execute_bash(SET_CERTBOT, domain)
