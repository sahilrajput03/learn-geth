# Unlock account so that you can deploy contracts with hardhat and truffle
# personal.unlockAccount(personal.listAccounts[0], "1", 300) // for 5 minutes
# Unlock till geth server is closed
personal.unlockAccount(personal.listAccounts[0], "1", 0)


# Account management with geth:
https://geth.ethereum.org/docs/interface/managing-your-accounts#:~:text=Import%20a%20keyfile&text=In%20this%20case%2C%20the%20private,text%20key%20without%20leading%200x).
