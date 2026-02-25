#!/bin/bash

echo "Pulling latest code... "
git pull origin main

echo "Stopping old container..."
docker stop myapp || true
docker rm myapp || true

echo "building new image..."
docker build -t myapp:latest .

echo "starting container..."
docker run -d -p 80:5000 --name myapp myapp:latest

echo "Deployment Successfull"