#!/bin/bash

# Pull the latest image
docker pull ravikshitiz/dev:latest

# Stop the currently running container
docker stop react-app || true
docker rm react-app || true

# Run a new container with the latest image
docker run -idt --name react-app -p 80:80 ravikshitiz/dev:latest


docker pull ubuntu/prometheus

docker run -d \
  --name prometheus \
  -p 9090:9090 \
  -v /ubuntu/home/prometheus.yml:/etc/prometheus/prometheus.yml \
  -v /ubuntu/home/prometheus/data:/prometheus \
  ubuntu/prometheus
