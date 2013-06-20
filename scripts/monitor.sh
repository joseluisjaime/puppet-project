#!/bin/bash

IP_BAL=$1
NUM=1
ADD_BALANCEADOR='/home/jose/puppet-project/scripts/vmtool.sh balanaux 14 1'

while [ $NUM -eq 1 ]; do

    CURRCONNS=$(ssh root@192.168.122.$IP_BAL "echo "show info" | socat unix-connect:/tmp/haproxy stdio | grep CurrConns | awk '{print $2}'")
    CONEX=$(echo $CURRCONNS | awk '{print $2}')
    echo $CONEX
    sleep 3

    if [ $CONEX -ge 300 ]; then
	
	echo "Numero de conexiones altas, añadiendo balanceador"
	$ADD_BALANCEADOR
	echo "Balanceador añadido"
	ssh root@192.168.122.$IP_BAL "puppet agent -t"
	exit
    fi

done