#!/bin/bash

# Build Docker image
sudo docker build -t ravikshitiz/dev:latest .

# Tag the image for the dev repository
sudo docker tag react-app:latest ravikshitiz/dev:latest

# Push to Docker Hub
sudo docker push ravikshitiz/dev-app:latest