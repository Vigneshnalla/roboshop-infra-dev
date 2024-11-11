#!/bin/bash
set -e
component=$1
environment=$2

# Install Ansible and required Python packages
dnf install -y ansible
pip3.9 install botocore boto3

# Clean any previously cached repository to ensure the latest version is pulled
rm -rf /root/.ansible/pull/*

# Run Ansible-pull with specified component and environment
/usr/local/bin/ansible-pull -i localhost, -U https://github.com/Vigneshnalla/expense-ansible-roles-tf.git main.yaml -e component=$component -e env=$environment
