#!/bin/bash

# Check if the Azure CLI is already installed
if command -v az &>/dev/null; then
    echo "Azure CLI is already installed."
else
    # Update the package list
    sudo apt update

    # Install required dependencies
    sudo apt install -y ca-certificates curl apt-transport-https lsb-release gnupg

    # Download and install the Microsoft signing key
    # curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor -o /usr/share/keyrings/microsoft-archive-keyring.
    curl -sL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft-archive-keyring.gpg


    # Add the Azure CLI repository to the APT sources list
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/azure-cli $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/azure-cli.list

    # Update the package list again to include the Azure CLI repository
    sudo apt update

    # Install the Azure CLI
    sudo apt install -y azure-cli

    # Verify the Azure CLI installation
    az --version
fi
