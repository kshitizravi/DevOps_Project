#!/bin/bash

# Pull the latest image
docker pull ravikshitiz/dev:latest

# Stop the currently running container
docker stop react-app || true
docker rm react-app || true

# Run a new container with the latest image
docker run -idt --name react-app -p 80:80 ravikshitiz/dev:latest
