#!/bin/bash
SERVERIP=192.168.80.10

watch -c 8 ping -c 3 $SERVERIP > /dev/null 2>&1
if [ $? -eq 0 ]
then
  umount /Data
  mount /dev/drbd0 /Data

fi
