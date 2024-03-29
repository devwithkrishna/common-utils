#!/bin/bash

# Update the package list
sudo apt update -y

# pull helm bash script
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3

# provide get_helm bash script execute access
chmod 700 get_helm.sh

# Install helm 
./get_helm.sh

# Test helm installations
helm version
