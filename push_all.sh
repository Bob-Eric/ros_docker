#!/bin/bash

# 定义仓库基础 URL
registry_base="registry.cn-hangzhou.aliyuncs.com/chy-sci"

# 标记并推送 Docker 镜像的函数
push_image() {
  local image=$1
  local registry=$2

  echo "Tagging and pushing $image to $registry..."
  docker tag $image $registry
  docker push $registry
}

# 通过参数选择推送 noetic 或 humble 或全部
case "$1" in
  noetic)
    push_image "ros:noetic" "$registry_base/ros:noetic"
    echo "ROS Noetic image pushed successfully."
    ;;
  humble)
    push_image "ros:humble" "$registry_base/ros:humble"
    echo "ROS Humble image pushed successfully."
    ;;
  *)
    push_image "ros:noetic" "$registry_base/ros:noetic"
    push_image "ros:humble" "$registry_base/ros:humble"
    echo "All images have been pushed."
    ;;
esac
