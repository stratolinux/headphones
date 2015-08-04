#! /bin/sh

cd $HEADDIR
exec /usr/bin/python Headphones.py -p 8181 --datadir=/config --nolaunch
