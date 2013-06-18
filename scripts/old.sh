#!/bin/bash

MACADDR=$(dd if=/dev/urandom bs=1024 count=1 2>/dev/null|md5sum|sed 's/^\(..\)\(..\)\(..\)\(..\)\(..\)\(..\).*$/\1:\2:\3:\4:\5:\6/')
UUID=$(uuid)
NAME=$1
BASEIMGNAME="base.img"
BASEIMGDIR="/media/linux/imagen"
cp $BASEIMGDIR/$BASEIMGNAME $BASEIMGDIR/$NAME.img
cp /home/jose/puppet-project/scripts/base.xml /etc/libvirt/qemu/$NAME.xml

sed -i 's/@@NAME@@/'$NAME'/g' /etc/libvirt/qemu/$NAME.xml 
sed -i 's/@@MAC@@/'$MACADDR'/g' /etc/libvirt/qemu/$NAME.xml 
sed -i 's/@@UUID@@/'$UUID'/g' /etc/libvirt/qemu/$NAME.xml 

virsh create $NAME





