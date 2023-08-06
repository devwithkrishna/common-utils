#!/bin/bash

# Download the latest Terraform version
latest_version=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

# Install unzip if not already installed
sudo apt update
sudo apt install -y unzip

# Download and install Terraform
wget "https://releases.hashicorp.com/terraform/${latest_version}/terraform_${latest_version}_linux_amd64.zip" -O /tmp/terraform.zip
sudo unzip -o /tmp/terraform.zip -d /usr/local/bin/

# Set executable permissions
sudo chmod +x /usr/local/bin/terraform

# Verify the installation
terraform --version
