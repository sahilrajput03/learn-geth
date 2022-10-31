#!/bin/bash
./clean.sh

# MY DEV ACCOUNTS
addr1="0xF1C8471dF8772D9ACE6fa116d5C5f077A3b7AFe6"
addr2="0xd2fCf98a201FA4319f5856503e9F05dF01eD2DDA"
addr3="0xF67187621a1CE42EBCEC146d644a2C321E3EFa45"
addr4="0x506b010FF4B7F16CCAb0B31453F4811564678B25"

# Use public address of D1, D2 and D3, adding 2100 eth to both(we define this in javascript file):
node ./generateGenesis.js $addr1 $addr2 $addr3 $addr4

# import accounts into keystore
geth account import --datadir bootNode --password ./my_password.txt dev_accounts/d1.txt
geth account import --datadir bootNode --password ./my_password.txt dev_accounts/d2.txt
geth account import --datadir bootNode --password ./my_password.txt dev_accounts/d3.txt
geth account import --datadir bootNode --password ./my_password.txt dev_accounts/d4.txt

# initialize geth db with genesis.json
geth init --datadir bootNode genesis.json

# LEARN: Unlocking multiple accounts at once on bootNode creation: https://ethereum.stackexchange.com/a/23268/106687
# NOTE YOU MUST CREATE PASSWORD FILE WITHOUT A NEWLINE CHARACTER IN THE `my_password` FILE.
# START GETH, complete cli options: https://geth.ethereum.org/docs/interface/command-line-options

# Start on hardhat like port i.e., 8545 (by default http server is run on port 8545 though, FYI: default ethereum mainnet port is 9545)
geth --syncmode=snap --snapshot=false --datadir bootNode --networkid 1337 --allow-insecure-unlock --unlock $addr1,$addr2,$addr3,$addr4 --password ./my_password.txt --http

# Start on truffle like port i.e., 9545
# geth --syncmode=snap --snapshot=false --datadir bootNode --networkid 1337 --allow-insecure-unlock --unlock $addr1,$addr2,$addr3,$addr4 --password ./my_password.txt --http --http.port 9545
