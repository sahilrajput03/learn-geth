#!/bin/bash

if [ -z "$@" ]; then 
	echo Please provide enode url ~Sahil
	exit 1
fi
addr1=$(sed -n '4p' < a1 | awk '{print $6}')
geth --datadir node1 --port 30306 --bootnodes "$@" --networkid 1337 --unlock $addr1 --password ./my_password.txt
