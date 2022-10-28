# Using geth - short notes

UPDATE: I am failing to make any transaction but there's error i.e, "peer connected on snap without compatible eth support" and it seems becoz of that I am not able to make any transactions but reads work like checking balance and conneciton to metamask also works. And deployement with hardhat starts but contracts never get deployed.

Source: https://geth.ethereum.org/docs/interface/private-network

```js
// javascript console methods (web3js api)
eth.accounts // get array of account addresses
eth.getBalance(eth.accounts[0]) // get balance
```

## Gettinb addresses by callin JSON rpc

```bash
curl -X POST http://127.0.0.1:8545 \
    -H "Content-Type: application/json" \
   --data '{"jsonrpc":"2.0", "method":"eth_accounts","params":[], "id":1}'
# Output:
{"jsonrpc":"2.0","id":1,"result":["0xada3c8e8a5806c06aea7de8b0eab35ef1dd6ad23"]}
```

## Executing a single command via attach

Getting `bootstrap node record`:

```bash
geth attach --exec admin.nodeInfo.enr data/geth.ipc
# Output:
# enr:-Ka4QFQDoa_R1-dvyVvHHJZu4hAz1Jrod45HdRXQyHWkQS7CGloX1K2d8BVPChimHbPvFwee2qsduMiXSW3tJw06AW2GAYQMExpJg2V0aMrJhPxk7ASDEYwwgmlkgnY0gmlwhHz9yIOJc2VjcDI1NmsxoQMb9yfdAcZa5_2zdGSD8HUspdpGLKIWmVmoYO5xtCpIZoRzbmFwwIN0Y3CCdl-DdWRwgnZf
```

## You must specify authrpc.port for second node

https://ethereum.stackexchange.com/a/133157/106687


## Starting n1 and n2
After starting bootnode (setup script does that automatically), then you can start n1 and n2 via:

```bash
# terminal 1
./n1 <ENCODE_URL_HERE_FROM_BOOTNODE>
# terminal 2
./n2 <ENCODE_URL_HERE_FROM_BOOTNODE>
````

Now you can query details like:

```js
// attach a Javascript console to either node to query the network properties:
geth attach node1/geth.ipc

// check if current node is connected to other node
net.peerCount

// details of this peer can also be queried and used to check that the peer really is Node 2:
admin.peers

// The account associated with Node 1:
eth.getBalance(eth.accounts[0])

// unlock account
personal.unlockAccount(eth.accounts[0])

//check the transaction was successful by querying Node 2's account balance
eth.getBalance("0x0622A967DE34b3D19f191A6edFA8bBa4c051c530")

// send 1 ether
eth.sendTransaction({to: eth.accounts[1], from: eth.accounts[0], value: 1000000000000000000, gas: 300000, gasPrice: 200000})
```
