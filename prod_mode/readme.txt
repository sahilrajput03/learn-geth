# Using this setup

**Steps:**

1. Start bootnode node: `./startBootNode.sh`
2. Start a member node i.e., node1: `./startNode1.sh`
3. Start mining in node1: `./startMiningInNode1.sh`

## Unlock account using javascript console so that you can deploy contracts with hardhat and truffle:

**Two ways of unlocking accounts:** src: https://ethereum.stackexchange.com/a/4159/106687

1. geth --unlock <YOUR_ACCOUNT_ADDRESS> --password <YOUR_PASSWORD>

2. Using javascript console, i.e, `geth attach` console:

```js
# personal.unlockAccount(personal.listAccounts[0], "1", 300) // for 5 minutes
# Unlock till geth server is closed
personal.unlockAccount(personal.listAccounts[0], "1", 0)
```

## Account management with geth:
https://geth.ethereum.org/docs/interface/managing-your-accounts#:~:text=Import%20a%20keyfile&text=In%20this%20case%2C%20the%20private,text%20key%20without%20leading%200x).
