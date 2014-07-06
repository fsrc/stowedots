#!/bin/sh

ismounted=$(mount | grep -e "music")

if [ -z "$ismounted" ] ; then
  ssh -fN -L "3049:10.0.0.120:2049" ksite.se
  sudo mount -t nfs4 -o port=3049 localhost:/srv/nfs4 /media
else
  sudo umount ~/media
fi

