#!/bin/bash

NEAR_ENV=mainnet near view "$1" get_account_total_balance "{\"account_id\": \"$2\"}"