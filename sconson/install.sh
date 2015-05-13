#!/bin/bash

#install predependence
cd deps/scons-2.3.4/
python setup.py install
cd -

#install sconson
mkdir /usr/local/sconson/ -p
rm /usr/local/sconson/* -rf

cp bin/* /usr/local/sconson/ -rf
