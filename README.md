# host-install-script
A script purposed to install all needed tools on a fresh ubuntu:18.04 host or QEMU/KVM Virtual machine

This script will install UHD-3.15,srsRan 20.04,gnuradio 3.7,and everything needed for docker

#To run:
git clone https://github.com/Aerpaw-MSU/host-install-script.git
cd host-install-script
chmod +x *.sh
sudo ./install.sh




#To be added:
-Need to add runtime parameters for changing versions and makeopts so the script can be more useful into the future and compile the source faster
-Possibly integrate with docker-compose or VM to automate entire process?

