FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu22.04

ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $>TZ > /etc/timezone

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update 

RUN echo "== Install Basic Tools ==" &&\
    apt install -y --allow-unauthenticated \
    openssh-server vim nano htop tmux sudo git unzip build-essential\
    python3 python3-pip curl dpkg libgtk2.0-dev \
    cmake libwebp-dev ca-certificates gnupg git \
    libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev \
    libatlas-base-dev gfortran \
    libgl1-mesa-glx libglu1-mesa-dev x11-utils x11-apps

RUN echo "== Install Dev Tolls ==" &&\
    pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118 &&\
    pip3 install gitpython matplotlib numpy opencv-python pillow psutil PyYAML requests scipy thop &&\
    pip3 install tqdm ultralytics pandas seaborn wandb setuptools wheel

RUN cd /home/ &&\
    git clone https://github.com/kongbuhaja/DL_PA2.git
