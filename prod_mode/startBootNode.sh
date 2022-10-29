#!/bin/bash
./clean.sh

# MY DEV ACCOUNTS
addr1=0xF1C8471dF8772D9ACE6fa116d5C5f077A3b7AFe6
addr2="0xd2fCf98a201FA4319f5856503e9F05dF01eD2DDA"
addr3="0xF67187621a1CE42EBCEC146d644a2C321E3EFa45"
addr4="0x506b010FF4B7F16CCAb0B31453F4811564678B25"

# Use public address of D1, D2 and D3, adding 2100 eth to both(we define this in javascript file):
node ./generateGenesis.js $addr1 $addr2 $addr3 $addr4

# import accounts into keystore (todo: make trufflePrivKeys to my_dev_accounts of metamask)
geth account import --datadir bootNode --password ./my_password.txt trufflePrivKeys/d1.txt
geth account import --datadir bootNode --password ./my_password.txt trufflePrivKeys/d2.txt
geth account import --datadir bootNode --password ./my_password.txt trufflePrivKeys/d3.txt
geth account import --datadir bootNode --password ./my_password.txt trufflePrivKeys/d4.txt

# initialize geth db with genesis.json
geth init --datadir bootNode genesis.json

addr1="0xF1C8471dF8772D9ACE6fa116d5C5f077A3b7AFe6"
# I was not able to unlock all addreses via provided way from geth i.e., `--unlock "addr1,addr2,addr3,addr4"` and I can't figure out to do it here, so I am unlocking account 2,3,4 when I start mining in the script i.e, `startMiningNode1.sh` by attaching to bootNode, Yo! ~Sahil

# START GETH, complete cli options: https://geth.ethereum.org/docs/interface/command-line-options
# start on hardhat like port i.e., 8545 (by default http server is run on port 8545 though, FYI: default ethereum mainnet port is 9545)
geth --syncmode=snap --snapshot=false --datadir bootNode --networkid 1337 --allow-insecure-unlock --unlock $addr1 --password ./my_password.txt --http

# start on truffle like port i.e., 9545
# geth --syncmode=snap --snapshot=false --datadir bootNode --networkid 1337 --allow-insecure-unlock --unlock $addr1 --password ./my_password.txt --http --http.port 9545
