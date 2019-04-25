#!/bin/bash

# Install swig
sudo apt install swig

# Installing required tools
sudo apt install git
sudo apt install cmake
sudo apt install libusb-1.0-0-dev

# Installing RTL-SDR driver
cd ~
git clone git://git.osmocom.org/rtl-sdr.git
cd rtl-sdr
mkdir build
cd build
cmake .. -DINSTALL_UDEV_RULES=ON # this makes driver available for non-sudo users
make
sudo make install
sudo ldconfig

# Testing rtl driver
# rtl_test

# Installing GNU Radio source block
cd ~
git clone https://github.com/balint256/gr-baz
cd gr-baz
mkdir build
cd build
cmake ..
sudo make install
sudo ldconfig

