#!/bin/bash

# Build Docker image
docker build -t react-app:latest .

# Tag the image for the dev repository
docker tag react-app:latest ravikshitiz/dev:latest

