#!/bin/bash

NUM=1

while [ $NUM -eq 1 ]; do

    CURRCONNS=$(ssh root@192.168.122.3 "echo "show info" | socat unix-connect:/tmp/haproxy stdio | grep CurrConns | awk '{print $2}'")
    CONEX=$(echo $CURRCONNS | awk '{print $2}')
    echo $CONEX
    sleep 3

    if [ $CONEX -ge 300 ]; then
	
	echo "lanzar balanceador"
    fi

    
done