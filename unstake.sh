#!/bin/bash

NEAR_ENV=mainnet near call "$1" unselect_staking_pool --accountId "$2" --useLedgerKey="44'/397'/0'/0'/$3'" --gas 175000000000000