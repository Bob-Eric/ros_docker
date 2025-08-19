#!/bin/bash

# Function to tag and push Docker images
push_image() {
  local image=$1
  local registry=$2

  echo "Tagging and pushing $image to $registry..."
  docker tag $image $registry
  docker push $registry
}

# Define the registry base URL
registry_base="registry.cn-hangzhou.aliyuncs.com/chy-sci"

# Push images
push_image "ros:noetic" "$registry_base/ros:noetic"
push_image "ros:humble" "$registry_base/ros:humble"

echo "All images have been pushed."
