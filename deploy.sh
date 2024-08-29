#!/bin/bash

# Pull the latest image
sudo docker pull ravikshitiz/dev:latest

# Stop the currently running container
sudo docker stop react-app || true
sudo docker rm react-app || true

# Run a new container with the latest image
sudo docker run -idt --name react-app -p 80:80 ravikshitiz/dev:latest
