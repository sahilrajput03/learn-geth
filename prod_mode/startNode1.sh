#!/bin/bash

if [ -z "$@" ]; then 
	echo Please provide enode url ~Sahil
	exit 1
fi
addr1="0xF1C8471dF8772D9ACE6fa116d5C5f077A3b7AFe6"
rm -rf node1
# You need atleast one account unlocked in the mining node so that it can mine successfully, otherwise it won't be able to mine at all and throw error in the client side. ~Sahil
geth account import --datadir node1 --password ./my_password.txt dev_accounts/d1.txt
geth init --datadir node1 genesis.json
geth --snapshot=false --datadir node1 --port 30306 --bootnodes "$@" --authrpc.port 8552 --networkid 1337 --allow-insecure-unlock --unlock $addr1 --password ./my_password.txt
