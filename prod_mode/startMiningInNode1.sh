#!/bin/bash
geth --exec 'miner.start()' attach node1/geth.ipc
# src: Non-interactive Use: Script Mode: https://geth.ethereum.org/docs/interface/javascript-console

# Unlock accounts manually: acc1, acc2 (acc 0 already unlocked when starting the bootNode)
# geth --exec 'personal.unlockAccount(personal.listAccounts[1], "1", 0); personal.unlockAccount(personal.listAccounts[2], "1", 0); personal.unlockAccount(personal.listAccounts[3], "1", 0)' attach bootNode/geth.ipc
