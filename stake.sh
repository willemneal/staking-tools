#!/bin/bash

AMOUNT=$(./to_yocto $2);
NEAR_ENV=mainnet near call "$1" deposit_and_stake "{\"amount\": \"$AMOUNT\"}" --accountId "$3" --useLedgerKey="44'/397'/0'/0'/$4'" --gas 125000000000000