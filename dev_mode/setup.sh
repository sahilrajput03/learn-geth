#!/bin/bash
./clean.sh
mkdir node1 node2

geth account new --datadir node1 --password ./my_password.txt > a1
geth account new --datadir node2 --password ./my_password.txt > a2

addr1=$(sed -n '4p' < a1 | awk '{print $6}')
addr2=$(sed -n '4p' < a2 | awk '{print $6}')

node ./generateGenesis.js $addr1 $addr2

cp genesis.json node1/
cp genesis.json node2/

geth init --datadir node1 genesis.json
geth init --datadir node2 genesis.json


# generate
bootnode -genkey boot.key 
# start bootnode
bootnode -nodekey boot.key -addr :30305

# Open separate terminals for each node, leaving the bootnode running in the original terminal. In each terminal, run
# geth --datadir node1 --port 30306 --bootnodes enode://f7aba85ba369923bffd3438b4c8fde6b1f02b1c23ea0aac825ed7eac38e6230e5cadcf868e73b0e28710f4c9f685ca71a86a4911461637ae9ab2bd852939b77f@127.0.0.1:0?discport=30305  --networkid 1337 --unlock 0xC1B2c0dFD381e6aC08f34816172d6343Decbb12b --password node1/password.txt
# geth --datadir node1 --port 30307 --bootnodes enode://f7aba85ba369923bffd3438b4c8fde6b1f02b1c23ea0aac825ed7eac38e6230e5cadcf868e73b0e28710f4c9f685ca71a86a4911461637ae9ab2bd852939b77f@127.0.0.1:0?discport=30305  --networkid 1337 --unlock 0xC1B2c0dFD381e6aC08f34816172d6343Decbb12b --password node1/password.txt

### MAGIC OF SED AND AWK ###
# GET 4TH LINE
# sed -n '4p' < a1
# GET 6TH COLUMN TEXT
# echo 'c1 c2 c3 c4 c5 c6' | awk '{print $6}'

