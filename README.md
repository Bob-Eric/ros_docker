# ROS Docker 环境

基于Docker的ROS Noetic(ROS1)和Humble(ROS2)开发环境，支持GPU图形渲染和远程桌面访问。

## 快速开始

### 启动容器
```bash
./run_all.sh [noetic|humble]  # 不带参数则启动全部
```

### 构建镜像
```bash
./build_all.sh [noetic|humble]  # 不带参数则构建全部
```

### 镜像管理
```bash
./pull_all.sh [noetic|humble]  # 从远程仓库拉取镜像
./push_all.sh [noetic|humble]  # 推送镜像到远程仓库
```

## 主要特性

- 支持ROS1(Noetic)和ROS2(Humble)
- 基于Ubuntu桌面环境(20.04/22.04)
- KasmVNC远程桌面访问(默认端口14000)
- GPU加速渲染支持
- 用户名/密码: ubuntu/ubuntu

## 容器配置

- 特权模式(`--privileged`)
- 主机网络模式(`--network=host`)
- GPU支持(`--gpus all`)
- 共享内存(`--shm-size=1024m`)
- 中国时区(Asia/Shanghai)
- 预配置ROS环境
- ROS2主机与容器内节点通信需额外配置

## 镜像仓库

默认仓库: `registry.cn-hangzhou.aliyuncs.com/chy-sci`

## 致谢

- [Ubuntu Desktop Docker](https://github.com/gezp/docker-ubuntu-desktop.git)
- [FishROS](https://github.com/fishros/install.git)