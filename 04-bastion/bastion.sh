#!/bin/bash

# Install Ansible using dnf
sudo dnf install ansible -y

# Check if Ansible was installed successfully
if ! command -v ansible &> /dev/null
then
    echo "Ansible installation failed!"
    exit 1
fi

# Define the Git repository URL
REPO_URL="https://github.com/Vigneshnalla/roboshop-ansible-roles.git"

# Clone the repository into the ec2-user's home directory as ec2-user
sudo -u ec2-user git clone "$REPO_URL" /home/ec2-user/roboshop-ansible-roles

# Output success message
echo "Repository cloned successfully to /home/ec2-user/roboshop-ansible-roles"
