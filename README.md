# host-install-script
A script purposed to install all needed tools on a fresh ubuntu:18.04 host or QEMU/KVM Virtual machine <br />

This script will install UHD-3.15,srsRan 20.04,gnuradio 3.8,and everything needed for docker <br />

# To run: <br />
git clone https://github.com/Aerpaw-MSU/host-install-script.git <br />
cd host-install-script <br />
chmod +x *.sh <br />
sudo ./install.sh <br />




# To be added: <br />
~~-Need to add runtime parameters for changing versions and makeopts so the script can be more useful into the future and compile the source faster~~ push 12 <br />
-Possibly integrate with docker-compose or VM to automate entire process? <br />

