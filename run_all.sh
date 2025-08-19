#!/bin/bash

ENABLE_DBUS=true

# Function to run Docker containers
run_container() {
  local tag=$1
  local name=$2

  echo "Running Docker container for $tag..."
  docker run -d \
    --name $name \
    $( $ENABLE_DBUS && echo "--privileged" ) \
    $( $ENABLE_DBUS && echo "-e DBUS_SYSTEM_BUS_ADDRESS=unix:path=/run/dbus/system_bus_socket" ) \
    --network=host \
    --ipc=host \
    --pid=host \
    --cap-add=SYS_PTRACE \
    --gpus all \
    --shm-size=1024m \
    -e USER=ubuntu \
    -e PASSWORD=ubuntu \
    -e GID=$(id -g) \
    -e UID=$(id -u) \
    -e REMOTE_DESKTOP=kasmvnc \
    $tag
}

run_container "ros:noetic" "noetic"
run_container "ros:humble" "humble"

echo "All containers are running."
