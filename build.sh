#!/bin/bash

# Build Docker image
docker build -t react-app/dev:latest .

# Tag the image for the dev repository
docker tag react-app/dev:latest ravikshitiz/dev:latest

