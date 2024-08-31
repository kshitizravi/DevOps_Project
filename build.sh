#!/bin/bash

# Build Docker image
docker build -t react-app/dev:latest .

# Tag the image for the dev repository
docker tag react-app/dev:latest ravikshitiz/dev:latest

docker pull ubuntu/prometheus

docker run -d --name prometheus -p 9090:9090 -v /ubuntu/home:/etc/prometheus ubuntu/prometheus
