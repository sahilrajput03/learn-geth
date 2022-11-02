# Using this setup

**Steps:**

1. Start bootnode node: `./startBootNode.sh`
2. Start a member node (with the enode address from the output of `startBootNode.sh` continous output) i.e., node1: `./startNode1.sh enode://105a9ddbde682de9b81070e134fed4b32214f2811cbc3882e51cac7cbdce3a0d0a10887078bfecfd811c70ac3065a0d4c4df3dc670b911a4e37196a6459d1561@127.0.0.1:30303`
3. Start mining in node1: `./startMiningInNode1.sh`
