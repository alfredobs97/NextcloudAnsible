#!/bin/bash
SERVERIP1=192.168.80.10
SERVERIP2=192.168.80.11

watch -c 8 ping -c 3 $SERVERIP1 > /dev/null 2>&1
if [ $? -eq 0 ]
then
  php /home/vagrant/mail1.php

fi
watch -c 8 ping -c 3 $SERVERIP2 > /dev/null 2>&1
if [ $? -eq 0 ]
then
  php /home/vagrant/mail2.php

fi
