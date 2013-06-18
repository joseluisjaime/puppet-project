#!/bin/bash

NAME=$1
IP=$2

virt-clone --connect qemu:///system --original base --name $NAME --file /media/linux/imagen/$NAME.img
virsh start $NAME
sleep 15
ssh root@192.168.122.122 "echo $NAME > /etc/hostname"
ssh root@192.168.122.122 "sed -i 's/base/$NAME/g' /etc/hosts"
ssh root@192.168.122.122 "echo '192.168.122.2 master.example.com master' >> /etc/hosts"
ssh root@192.168.122.122 "sed -i 's/192.168.122.122/192.168.122.$IP/g' /etc/network/interfaces"
ssh root@192.168.122.122 "sed -i 's/START=no/START=yes/g' /etc/default/puppet"
ssh root@192.168.122.122 "reboot"
sleep 20
ssh root@192.168.122.2 "puppet cert --sign $NAME.example.com"