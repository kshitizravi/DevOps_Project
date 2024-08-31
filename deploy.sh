#!/bin/bash

# Pull the latest image
docker pull ravikshitiz/dev:latest

# Stop the currently running container
docker stop react-app || true
docker rm react-app || true

# Run a new container with the latest image
docker run -idt --name react-app -p 80:80 ravikshitiz/dev:latest

#Pull prometheus latest image
docker pull ubuntu/prometheus

#Run prometheus inside docker
docker run -d \
  --name prometheus \
  -p 9090:9090 \
  -v /home/ubuntu/prometheus.yml:/etc/prometheus/prometheus.yml \
  -v /home/ubuntu/prometheus/data:/prometheus \
  ubuntu/prometheus

