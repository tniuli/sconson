#!/bin/bash

#install predependence
cd deps/scons-2.3.4/
python setup.py install
cd -

#install sconson
mkdir /usr/local/sconson/ -p
rm /usr/local/sconson/* -rf

cp bin/* /usr/local/sconson/ -rf

if [ -f /usr/bin/create_project.sh ]; then
  rm /usr/bin/create_project.sh
fi
ln -s /usr/local/sconson/create_project.sh /usr/bin/create_project.sh
echo "success!!"
