#!/bin/bash

# Get EC2 public IP
read -p "Enter your EC2 public IP address: " EC2_IP

# Update .env file
sed -i "s/YOUR_EC2_PUBLIC_IP/$EC2_IP/g" .env

echo "Updated .env with IP: $EC2_IP"

# Build and deploy
docker-compose down
docker-compose build --no-cache
docker-compose up -d

echo "Deployment complete! Access your app at: http://$EC2_IP"