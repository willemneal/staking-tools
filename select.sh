#!/bin/bash


NEAR_ENV=mainnet near call "$1" select_staking_pool "{\"staking_pool_account_id\": \"$2\"}" --accountId "$3" --useLedgerKey="44'/397'/0'/0'/$4'"