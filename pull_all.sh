#!/bin/bash

# 定义仓库基础 URL
registry_base="registry.cn-hangzhou.aliyuncs.com/chy-sci"

# 拉取并标记 Docker 镜像的函数
pull_image() {
  local image=$1
  local registry=$2

  echo "Pulling and tagging image from $registry..."
  docker pull $registry
  docker tag $registry $image
}

# 通过参数选择拉取 noetic 或 humble 或全部
case "$1" in
  noetic)
    pull_image "ros:noetic" "$registry_base/ros:noetic"
    echo "ROS Noetic image pulled successfully."
    ;;
  humble)
    pull_image "ros:humble" "$registry_base/ros:humble"
    echo "ROS Humble image pulled successfully."
    ;;
  *)
    pull_image "ros:noetic" "$registry_base/ros:noetic"
    pull_image "ros:humble" "$registry_base/ros:humble"
    echo "All images have been pulled."
    ;;
esac
