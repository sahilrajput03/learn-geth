#!/bin/bash
./clean.sh

# Use public address of D1, D2 and D3, adding 2100 eth to both(we define this in javascript file):
node ./generateGenesis.js 0xF1C8471dF8772D9ACE6fa116d5C5f077A3b7AFe6 0xd2fCf98a201FA4319f5856503e9F05dF01eD2DDA 0xF67187621a1CE42EBCEC146d644a2C321E3EFa45

# import accounts into keystore
geth account import --datadir bootNode --password ./my_password.txt trufflePrivKeys/d1.txt
geth account import --datadir bootNode --password ./my_password.txt trufflePrivKeys/d2.txt
geth account import --datadir bootNode --password ./my_password.txt trufflePrivKeys/d3.txt

# initialize geth db with genesis.json
geth init --datadir bootNode genesis.json

# START GETH, complete cli options: https://geth.ethereum.org/docs/interface/command-line-options
# start on hardhat like port i.e., 8545

addr1="0xF1C8471dF8772D9ACE6fa116d5C5f077A3b7AFe6"
geth --syncmode=snap --snapshot=false --datadir bootNode --networkid 1337 --allow-insecure-unlock --unlock $addr1 --password ./my_password.txt --http

# start on truffle like port i.e., 9545
# geth --snapshot=false --datadir bootNode --networkid 12345 --allow-insecure-unlock --http --http.port 9545
