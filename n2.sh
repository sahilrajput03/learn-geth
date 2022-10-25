#!/bin/bash

if [ -z "$@" ]; then 
	echo Please provide enode url ~Sahil
	exit 1
fi
addr2=$(sed -n '4p' < a2 | awk '{print $6}')
geth --datadir node2 --port 30307 --bootnodes "$@" --networkid "123454321" --unlock $addr2 --password ./my_password.txt --authrpc.port 8546 
