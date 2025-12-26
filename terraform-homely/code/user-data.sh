#!/bin/bash

##exit script immediately if command fails
set -e

# Update system
apt-get update -y
apt-get upgrade -y

# Install required packages
apt-get install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release \
  git \
  ufw

# Install Java (Jenkins requirement)
apt-get install -y openjdk-17-jdk

# Install Maven
apt-get install -y maven

# Verify Maven installation
mvn -version

# Add Jenkins GPG key
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key \
  | tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repository
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ \
  | tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Install Jenkins
apt-get update -y
apt-get install -y jenkins

# Enable and start Jenkins
systemctl enable jenkins
systemctl start jenkins

# Allow Jenkins port
ufw allow 8080
ufw --force enable

# Print Jenkins initial admin password to logs
echo "Jenkins initial admin password:"
cat /var/lib/jenkins/secrets/initialAdminPassword
