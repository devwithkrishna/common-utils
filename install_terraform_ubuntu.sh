#!/bin/bash
#install wget unzip packages
sudo apt install wget unzip -y

#download latest terraform archive
TER_VER=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d: -f2 | tr -d \"\,\v | awk '{$1=$1};1')
wget https://releases.hashicorp.com/terraform/${TER_VER}/terraform_${TER_VER}_linux_amd64.zip

#extract terraform 
unzip terraform_${TER_VER}_linux_amd64.zip

#move binary to /usr/local/bin
sudo mv terraform /usr/local/bin/

#checking terraform installation
which terraform

#terraform --version
terraform --version
