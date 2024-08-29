#!/bin/bash

# Build Docker image
docker build -t ravikshitiz/dev:latest .

# Tag the image for the dev repository
docker tag react-app:latest ravikshitiz/dev:latest

