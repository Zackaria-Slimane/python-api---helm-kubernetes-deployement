#!/bin/bash
# Install Docker
sudo apt-get update
sudo apt-get install docker.io -y
sudo usermod -aG docker $"USER"
sudo chmod 777 /var/run/docker.sock

sudo systemctl enable docker
sudo systemctl start docker

# Install Docker-compose
sudo apt-get update
sudo apt-get install docker-compose-plugin

echo "Docker and Docker-compose installed successfully"
