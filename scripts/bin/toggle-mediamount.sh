#!/bin/sh

ismounted=$(mount | grep -e "music")

if [ -z "$ismounted" ] ; then
  sudo mount -t nfs4 10.0.0.120:/srv/nfs4 /media
else
  sudo umount ~/media
fi

