#!/bin/bash

# Function to build Docker images
build_image() {
  local dir=$1
  local tag=$2

  echo "Building Docker image for $dir with tag $tag..."
  docker build -t $tag --network host $dir
}

# Build images for each directory
build_image "noetic" "ros:noetic"
build_image "humble" "ros:humble"

echo "All images built successfully."
