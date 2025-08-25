#!/bin/bash

# Function to build Docker images
build_image() {
  local dir=$1
  local tag=$2

  echo "Building Docker image for $dir with tag $tag..."
  docker build -t $tag --network host $dir
}

# 通过参数选择构建 noetic 或 humble 或全部
case "$1" in
  noetic)
    build_image "noetic" "ros:noetic"
    echo "ROS Noetic image built successfully."
    ;;
  humble)
    build_image "humble" "ros:humble"
    echo "ROS Humble image built successfully."
    ;;
  *)
    build_image "noetic" "ros:noetic"
    build_image "humble" "ros:humble"
    echo "All images built successfully."
    ;;
esac
