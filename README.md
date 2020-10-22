# Staking scripts

These are a collection of scripts to make it easier to stake NEAR from the command line.

## __NOTE__: This only works if your account is an HD Path on a ledger

### Before you start

Make sure that your ledger is unlocked and that the near application is open (also note you need to approve "Pending Ledger review").

### Select

The first script is [`select.sh`](./select.sh), which takes:

- Lockup contract account ID
- Staking pool account ID
- Your Account ID and the suffix of your HD path, e.g. path `44'/397'/0'/0'/4'`'s suffix is `4`.

e.g.

```bash
./select.sh 123abc.lockup.near YOUR_CHOICE.poolv1.near accountID 4
```

You then need to approve the transaction on your ledger.

If this returns an error most likely you need to make sure your ledger is unlocked and in the NEAR app.

### Stake

This is the main contract call that stakes a certain amount into the pool's contract. Since it is already selected and you can only stake to one pool with each account you don't need to include it in this call.

__NOTE__: You need to have at least 35 Near remaining in the lockup contract to cover the cost of the contract's storage. You can also keep more for safety.

The [`stake.sh`](./stake.sh) contract takes the following arguments:

- lockup contract account ID
- Amount in NEAR to stake

__NOTE__: The actual contract call is in yoctoNEAR, (10^24 yoctoNear = 1 NEAR), so don't be alarmed if you see a big number in the output

Suppose you have 100 NEAR and want to stake 50 of them.

```bash
./stake.sh 123abc.lockup.near 50 accountId 4
```

You again need to approve the transaction on your ledger.

### Check

[`check.sh`](./check.sh) lets you check on your staked balance.

It takes:

- pool accountID
- Lockup account ID

This is a view call and thus doesn't require that you sign the transaction and is free!

### [`balances`](./balances)

Add a json file called `accounts.json` in this directory with the an array of pool account IDs and lockup IDs, `./balances`. Note: don't include the suffixes.

e.g. for `123abc.lockup.near` and `YOUR_CHOICE.poolv1.near`:

```json
[
  {
    "poolID": "poolPrefix",
    "lockupID": "lockupPrefix"
  }
]
```

Then `./balances` will return all of your current balances.
