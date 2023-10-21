#!/bin/bash

# Check if the kubectl binary already exists
if [ -x "$(command -v kubectl)" ]; then
  echo "kubectl is already installed. Exiting."
  exit 0
fi

# Check if curl is installed. If not, install it.
if ! [ -x "$(command -v curl)" ]; then
  sudo apt update
  sudo apt install -y curl
fi

# Download the kubectl binary
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# Make the downloaded binary executable
chmod +x kubectl

# Move kubectl to a directory in your PATH
sudo mv kubectl /usr/local/bin/

# Verify the installation
kubectl version --client

echo "kubectl has been installed successfully."
