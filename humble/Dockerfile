FROM registry.cn-hongkong.aliyuncs.com/gezp/ubuntu-desktop:22.04

# Install mesa
RUN apt update && apt install mesa-utils \
    && apt-get clean

# Set timezone
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone

COPY fish_install.yaml ./

RUN wget http://fishros.com/install  -O fishros && /bin/bash fishros \
    && rm -rf /var/lib/apt/lists/*  /tmp/* /var/tmp/* \
    && apt-get clean && apt autoclean 

RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc 

ENV DISPLAY=:0