#!/bin/bash

NAME=$1
IP=$2
BALANCEADOR=$3
NODE='/home/jose/puppet-project/manifests/nodes.pp'
HIERA_HAPROXY='/home/jose/puppet-project/hieradata/haproxy.yaml'
UPDATE_SCIPT='/home/jose/puppet-project/scripts/update.sh'

if [ $BALANCEADOR = 1 ]; then

    echo "node '$NAME.example.com' {
  include apache
  include php
}" >> $NODE

    sed -i "s/config_server3: ''/config_server3: 'server'/g" $HIERA_HAPROXY
    sed -i "s/config_name3: ''/config_name3: '$NAME'/g" $HIERA_HAPROXY
    sed -i "s/config_ip3: ''/config_ip3: '192.168.122.$IP'/g" $HIERA_HAPROXY
    
    $UPDATE_SCRIPT
    
fi

ssh root@192.168.122.2 "puppet cert clean $NAME.example.com"
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
#ssh root@192.168.122.$IP "puppet agent -t"
