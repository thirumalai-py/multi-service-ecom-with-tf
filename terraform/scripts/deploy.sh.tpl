#!/bin/bash

EC2_IP=$1

sudo apt update -y
sudo apt install docker.io -y
sudo service docker start
sudo service docker enable || true  # "enable" might not exist, so we ignore errors
sudo usermod -aG docker ubuntu
newgrp docker || true



docker run -d -p 3001:3001 \
--name user-app \
-e PORT="3001" \
-e MONGODB_URI="${MONGODB_URI}" \
-e JWT_SECRET="${JWT_SECRET}" \
thirumalaipy/ecom-users:1.0

docker run -d -p 3002:3002 \
--name product-api \
-e PORT="3002" \
-e MONGODB_URI="${MONGODB_URI}" \
thirumalaipy/ecom-products:1.0

docker run -d -p 3003:3003 \
--name cart-api \
-e PORT="3003" \
-e MONGODB_URI="${MONGODB_URI}" \
-e PRODUCT_SERVICE_URL="http://${EC2_IP}:3002" \
thirumalaipy/ecom-cart:1.0

docker run -d -p 3004:3004 \
--name order-api \
-e PORT="3004" \
-e MONGODB_URI="${MONGODB_URI}" \
-e CART_SERVICE_URL="http://${EC2_IP}:3003" \
-e PRODUCT_SERVICE_URL="http://${EC2_IP}:3002" \
-e USER_SERVICE_URL="http://${EC2_IP}:3001" \
thirumalaipy/ecom-order:1.0

docker run -d -p 3000:3000 \
--name ecom-frontend \
-e REACT_APP_USER_SERVICE_URL="http://${EC2_IP}:3001" \
-e REACT_APP_PRODUCT_SERVICE_URL="http://${EC2_IP}:3002" \
-e REACT_APP_CART_SERVICE_URL="http://${EC2_IP}:3003" \
-e REACT_APP_ORDER_SERVICE_URL="http://${EC2_IP}:3004" \
thirumalaipy/ecom-frontend:1.0
