#!/bin/bash

# Update package information
sudo apt update -y

# Install Java (Jenkins requires Java)
sudo apt install -y default-jre

# Add the Jenkins repository key
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

# Add the Jenkins repository to the system
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update package information again to include the Jenkins repository
sudo apt update -y

# Install Jenkins
sudo apt install -y jenkins

# Start Jenkins service
sudo systemctl start jenkins

# Enable Jenkins service to start on boot
sudo systemctl enable jenkins

# Display initial Jenkins admin password
echo "Waiting for Jenkins to start..."
sleep 45  # Wait for Jenkins to start (adjust as needed)
echo "Jenkins initial admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

# Access your jenkins at <ip address>:8080 port or <dns_record>:8080 port and enter the initial admin password displayed

