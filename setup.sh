#!/bin/bash
./clean.sh

# Use public address of D1 and D2 and add 1000 eth to both(we define this in javascript file):
node ./generateGenesis.js 0xF1C8471dF8772D9ACE6fa116d5C5f077A3b7AFe6 0xd2fCf98a201FA4319f5856503e9F05dF01eD2DDA

geth account import --datadir bootNode --password ./my_password.txt trufflePrivKeys/d1.txt
geth account import --datadir bootNode --password ./my_password.txt trufflePrivKeys/d2.txt
geth init --datadir bootNode genesis.json
