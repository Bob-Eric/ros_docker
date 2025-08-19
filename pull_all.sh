#!/bin/bash

# Function to tag and push Docker images
pull_image() {
  local image=$1
  local registry=$2

  echo "Pulling and tagging $image to $registry..."
  docker pull $registry
  docker tag $registry $image
}

# Define the registry base URL
registry_base="registry.cn-hangzhou.aliyuncs.com/chy-sci"

# Pull images
pull_image "ros:noetic" "$registry_base/ros:noetic"
pull_image "ros:humble" "$registry_base/ros:humble"

echo "All images have been pulled."
