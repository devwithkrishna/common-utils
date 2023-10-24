#! /bin/bash

# Check if curl is installed. If not, install it.
if ! [ -x "$(command -v curl)" ]; then
  sudo apt update
  sudo apt install -y curl
fi

# Download and install minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64

sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Start minikube
minikube start

# Verify minikube is installed
minikube status