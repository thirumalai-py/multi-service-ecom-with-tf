#!/bin/bash

EC2_IP=$1

# Install Docker
sudo apt update -y
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Pull images
docker pull thirumalaipy/ecom-user:1.0
docker pull thirumalaipy/ecom-product:1.0
docker pull thirumalaipy/ecom-cart:1.0
docker pull thirumalaipy/ecom-order:1.0
docker pull thirumalaipy/ecom-frontend:1.0



