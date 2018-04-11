#!/bin/bash
# Installation guide
# OS Ubuntu 16.04 64bit
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
script_dir=$(pwd)
cd $HOME
################################################################################
# Basic dependencies for JetPack 3.2 on Jetson TX2.                            #
################################################################################
sudo apt-get install -y
    libprotobuf-dev \
    libleveldb-dev \
    libsnappy-dev \
    libhdf5-serial-dev \
    protobuf-compiler
################################################################################
# Dependencies for boost C++.                                                  #
################################################################################
sudo apt-get install -y --no-install-recommends libboost-all-dev
################################################################################
# Dependencies for BLAS (use altals).                                          #
################################################################################
sudo apt-get install -y libatlas-base-dev
################################################################################
# Dependencies for Python.                                                     #
################################################################################
sudo apt-get install -y python-dev
sudo pip2 install numpy \
    ipython \
    protobuf \
    Cython \
    matplotlib \
    scipy \
    pyyaml \
    EasyDict \
    argparse \
    scikit-image
################################################################################
# Dependencies for Google glog and imdb.                                       #
################################################################################
sudo apt-get install -y libgflags-dev libgoogle-glog-dev liblmdb-dev
################################################################################
# Download caffe from git.                                                     #
################################################################################
git clone https://github.com/BVLC/caffe.git
cd caffe
cp ${script_dir}"caffe/Makefile.config" .
################################################################################
# Compile Caffe.                                                               #
################################################################################
make clean
make all -j8