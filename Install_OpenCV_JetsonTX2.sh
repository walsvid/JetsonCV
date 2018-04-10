#!/bin/bash
# Installation guide
# OS Ubuntu 16.04 64bit
# OpenCV 3.4.0
# Jetpack 3.2
# Jetson TX2

################################################################################
# Prerequisite                                                                 #
# Complete installation of JetPack 3.2 on Jetson TX2.                          #
################################################################################
cd $HOME
################################################################################
# Remove all old opencv stuffs installed by JetPack (or OpenCV4Tegra)          #
# Build numpy from source using pip                                            #
################################################################################
sudo apt purge -y libopencv*
sudo apt purge -y python-numpy
sudo apt autoremove
################################################################################
# Dependencies for build essential.                                            #
################################################################################
sudo apt install -y \
    build-essential \
    make \
    cmake \
    cmake-curses-gui \
    g++ \
    libavformat-dev \
    libavutil-dev \
    libswscale-dev \
    libv4l-dev \
    libeigen3-dev \
    libglew-dev \
    libgtk2.0-dev \
    libtiff5-dev \
    zlib1g-dev \
    libjpeg-dev \
    libpng12-dev \
    libjasper-dev \
    libpostproc-dev \
    libtbb-dev \
    pkg-config
################################################################################
# Install dependencies for gstreamer stuffs.                                   #
################################################################################
sudo apt install -y \
    libdc1394-22-dev \
    libxine2-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev
################################################################################
# Install dependencies for image file decoder and encoder.                     #
################################################################################