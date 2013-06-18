#!/bin/bash

nombre=$1
ip=$2

ssh root@192.168.122.122 "echo $1 > /etc/hostname"
ssh root@192.168.122.122 "sed -i 's/base/$1/g' /etc/hosts"
ssh root@192.168.122.122 "echo '192.168.122.2 master.example.com master' >> /etc/hosts"
ssh root@192.168.122.122 "echo '192.168.122.3 client.example.com client' >> /etc/hosts"
ssh root@192.168.122.122 "sed -i 's/192.168.122.122/192.168.122.$2/g' /etc/network/interfaces"
ssh root@192.168.122.122 "sed -i 's/START=no/START=yes/g' /etc/default/puppet"
ssh root@192.168.122.122 "reboot"