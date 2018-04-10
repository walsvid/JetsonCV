#!/bin/bash
# Installation guide
# OS Ubuntu 16.04 64bit
# OpenCV 3.4.0
# Jetpack 3.2
# Jetson TX2
installguide="Installation guide"
installos="Ubuntu 16.04 64bit"
installopencv="OpenCV 3.4.0"
installjetpack="Jetpack 3.2"
installjetson="Jetson TX2"
echo "\033[31m****${installguide}\033[0m****"
echo "OS:              \033[32m${installos}\033[0m"
echo "OpenCV version:  \033[33m${installopencv}\033[0m"
echo "Jetpack version: \033[34m${installjetpack}\033[0m"
echo "Jetson Type:     \033[35m${installjetson}\033[0m"


loginfo() {
    echo "\033[44;37m"$1"\033[0m"
}
logwarn() {
    echo "\033[41;37m"$1"\033[0m"
}
################################################################################
# Prerequisite                                                                 #
# Complete installation of JetPack 3.2 on Jetson TX2.                          #
################################################################################
loginfo "Prerequisite."
loginfo "Complete installation of JetPack 3.2 on Jetson TX2."
logwarn "Enter 'y' if you would like to install 'n' to cancel." 
select yn in "y" "n"; do
    case $yn in
        y ) echo "!!!"; break;;
        n ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
cd $HOME
################################################################################
# Remove all old opencv stuffs installed by JetPack (or OpenCV4Tegra)          #
# Build numpy from source using pip                                            #
################################################################################
loginfo "Remove all old opencv stuffs."
sudo apt purge -y libopencv*
sudo apt purge -y python-numpy
sudo apt autoremove
################################################################################
# Dependencies for build essential.                                            #
################################################################################
loginfo "Dependencies for build essential."
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
loginfo "Install dependencies for gstreamer stuffs."
sudo apt install -y \
    libdc1394-22-dev \
    libxine2-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev
################################################################################
# Install dependencies for image file decoder and encoder.                     #
################################################################################
loginfo "Install dependencies for image file decoder and encoder."
sudo apt-get install -y \
    libjpeg8-dev \
    libjpeg-turbo8-dev \
    libtiff5-dev \
    libjasper-dev \
    libpng12-dev \
    libavcodec-dev \
    libxvidcore-dev \
    libx264-dev \
    libgtk-3-dev \
    libatlas-base-dev \
    gfortran
################################################################################
# Install Qt5 dependencies.                                                    #
################################################################################
sudo apt-get install -y qt5-default
################################################################################
# Install dependencies for python3.                                            #
################################################################################
sudo apt-get install -y python3-dev python3-pip python3-tk
sudo pip3 install numpy
sudo pip3 install matplotlib
################################################################################
# Also install dependencies for python2.                                       #
################################################################################
sudo apt-get install -y python-dev python-pip python-tk
sudo pip2 install numpy
sudo pip2 install matplotlib
################################################################################
# Modify matplotlibrc backend.                                                 #
################################################################################
py3_path="/usr/local/lib/python3.5/dist-packages/"
py2_path="/usr/local/lib/python2.7/dist-packages/"
matplotlib_cfg="matplotlib/mpl-data/matplotlibrc"
backend_agg="backend      : TkAgg"
py3_matplotlib_cfg=${py3_path}${matplotlib_cfg}
py2_matplotlib_cfg=${py2_path}${matplotlib_cfg}
sudo sed -i "41s|^.*$|${backend_agg}|" ${py3_matplotlib_cfg}
sudo sed -i "41s|^.*$|${backend_agg}|" ${py2_matplotlib_cfg}
################################################################################
# Fix OpenGL related compilation problems.                                     #
################################################################################
array=(62 63 64 65 66 68)
cuda_gl_interop="/usr/local/cuda/include/cuda_gl_interop.h"
for data in ${array[@]}
do  
    sudo sed -i ${data}'s|^|//|' ${cuda_gl_interop}
done
cd /usr/lib/aarch64-linux-gnu/
sudo ln -sf tegra/libGL.so libGL.so
################################################################################
# Download OpenCV.                                                             #
################################################################################
cd $HOME
git clone https://github.com/opencv/opencv.git
cd opencv
git checkout 3.4.0
mkdir build
cd build
################################################################################
# Make OpenCV.                                                                 #
################################################################################
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local \
        -D WITH_CUDA=ON -D CUDA_ARCH_BIN="6.2" -D CUDA_ARCH_PTX="" \
        -D WITH_CUBLAS=ON -D ENABLE_FAST_MATH=ON -D CUDA_FAST_MATH=ON \
        -D ENABLE_NEON=ON -D WITH_LIBV4L=ON -D BUILD_TESTS=OFF \
        -D BUILD_PERF_TESTS=OFF -D BUILD_EXAMPLES=OFF \
        -D WITH_QT=ON -D WITH_OPENGL=ON ..
make -j4
sudo make install