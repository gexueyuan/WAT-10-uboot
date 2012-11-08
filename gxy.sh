#!/bin/sh

make clean
make smdk6450_config
make

cd  sd_fusing
sudo ./sd_fusing.sh /dev/sdc
cd ..
