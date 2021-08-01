#!/bin/bash
#Author:Joshua Moore

#This script is aimed at automating the host configuration for AERPAW development

#From a fresh 18.04 install update
apt update -y
apt upgrade -y

#start building UHD-3.15 from source

apt-get install libboost-all-dev libusb-1.0-0-dev doxygen python3-docutils python-pip python3-mako python3-numpy python-mako python3-requests python3-ruamel.yaml python3-setuptools cmake build-essential -y

mkdir ~/WorkArea/
cd ~/WorkArea/

git clone https://github.com/EttusResearch/uhd.git
cd uhd/
cd host/
mkdir build
git checkout UHD-3.15.LTS
cd build
cmake ../
make -j $(nproc --all)
make install
ldconfig

#start installing srsRan 20.04 from source
apt-get install build-essential cmake libfftw3-dev libmbedtls-dev libboost-program-options-dev libconfig++-dev libsctp-dev -y

cd ~/WorkArea/
git clone https://github.com/srsRAN/srsRAN.git
cd srsRAN
git checkout -b 20.04
mkdir build
cd build
cmake ../
make -j $(nproc --all)
make install
srsran_install_configs.sh user


#start install gnuradio 3.8 from source
cd ~/WorkArea/
apt install git cmake g++ libboost-all-dev libgmp-dev swig python3-numpy python3-mako python3-sphinx python3-lxml doxygen libfftw3-dev libsdl1.2-dev libgsl-dev libqwt-qt5-dev libqt5opengl5-dev python3-pyqt5 liblog4cpp5-dev libzmq3-dev python3-yaml python3-click python3-click-plugins python3-zmq python3-scipy python3-pip python3-gi-cairo -y

pip3 install git+https://github.com/pyqtgraph/pyqtgraph@develop
pip3 install numpy scipy
echo 'export PYTHONPATH=/usr/local/lib/python3/dist-packages:usr/local/lib/python2.7/site-packages:$PYTHONPATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
echo 'export PYTHONPATH=/usr/local/lib/python3/dist-packages:usr/local/lib/python2.7/site-packages:$PYTHONPATH' >> ~/.profile
echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> ~/.profile
git clone --recursive https://github.com/gnuradio/gnuradio
cd gnuradio
git checkout maint-3.8
mkdir build
cd build
git pull --recurse-submodules=on
git submodule update --init
cmake -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 ../
make -j $(nproc --all)
make install
ldconfig


#install docker
apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update -y
apt-get install docker-ce docker-ce-cli containerd.io -y

echo "You should now have a fully configured system to start developing for AERPAW,please reboot your computer before starting!"


