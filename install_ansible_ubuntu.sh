#!/bin/bash

# Update the package list to ensure you have the latest information
sudo apt update

# Install software-properties-common to add the Ansible PPA
sudo apt install -y software-properties-common

# Add the Ansible PPA repository
sudo add-apt-repository -y ppa:ansible/ansible

# Update the package list again to include the new Ansible PPA
sudo apt update

# Install Ansible
sudo apt install -y ansible

# Verify the Ansible installation
ansible --version
