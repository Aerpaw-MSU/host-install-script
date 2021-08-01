FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y 
   

# SRS Dependencies
CMD bash

#additional programs
RUN apt-get update && apt-get install -y moreutils
RUN apt-get update && apt-get install -y screen


RUN apt-get install libboost-all-dev libusb-1.0-0-dev doxygen python3-docutils python-pip python3-mako python3-numpy python-mako python3-requests python3-ruamel.yaml python3-setuptools cmake build-essential -y

RUN mkdir ~/WorkArea/ 
RUN cd ~/WorkArea/

RUN git clone https://github.com/EttusResearch/uhd.git
RUN cd uhd/
RUN cd host/
RUN mkdir build
RUN git checkout UHD-3.15.LTS
RUN cd build
RUN cmake ../
RUN make -j $(nproc --all)
RUN make install
RUN ldconfig

#start installing srsRan 20.04 from source
RUN apt-get install build-essential cmake libfftw3-dev libmbedtls-dev libboost-program-options-dev libconfig++-dev libsctp-dev -y

RUN cd ~/WorkArea/
RUN git clone https://github.com/srsRAN/srsRAN.git
RUN cd srsRAN
RUN git checkout -b 20.04
RUN mkdir build
RUN cd build
RUN cmake ../
RUN make -j $(nproc --all)
RUN make install
RUN srsran_install_configs.sh user


#start install gnuradio 3.8 from source
RUN cd ~/WorkArea/
RUN apt install git cmake g++ libboost-all-dev libgmp-dev swig python3-numpy python3-mako python3-sphinx python3-lxml doxygen libfftw3-dev libsdl1.2-dev libgsl-dev libqwt-qt5-dev libqt5opengl5-dev python3-pyqt5 liblog4cpp5-dev libzmq3-dev python3-yaml python3-click python3-click-plugins python3-zmq python3-scipy python3-pip python3-gi-cairo -y

RUN pip3 install git+https://github.com/pyqtgraph/pyqtgraph@develop
RUN pip3 install numpy scipy
RUN echo 'export PYTHONPATH=/usr/local/lib/python3/dist-packages:usr/local/lib/python2.7/site-packages:$PYTHONPATH' >> ~/.bashrc
RUN echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> ~/.bashrc
RUN echo 'export PYTHONPATH=/usr/local/lib/python3/dist-packages:usr/local/lib/python2.7/site-packages:$PYTHONPATH' >> ~/.profile
RUN echo 'export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH' >> ~/.profile
RUN git clone --recursive https://github.com/gnuradio/gnuradio
RUN cd gnuradio
RUN git checkout maint-3.8
RUN mkdir build
RUN cd build
RUN git pull --recurse-submodules=on
RUN git submodule update --init
RUN cmake -DCMAKE_BUILD_TYPE=Release -DPYTHON_EXECUTABLE=/usr/bin/python3 ../
RUN make -j $(nproc --all)
RUN make install
RUN ldconfig


RUN apt install -y net-tools iputils-ping nano iperf3 iperf inetutils-traceroute traceroute usbutils iproute2 isc-dhcp-client emacs python3 python3-pip screen emacs25

RUN pip3 install dronekit python-pytun pymavlink pyserial zmq keyboard numpy



