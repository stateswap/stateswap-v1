Stateswap
-----------
[![Build Status](https://app.travis-ci.com/stateswap/stateswap-v1.svg?branch=main)](https://app.travis-ci.com/stateswap/stateswap-v1)

Stateswap is a protocol to create state change swaps between arbitrary smart contract function calls.

Find more information [here](https://stateswap.io/).


### Development

#### Setup

Install dependencies with [Yarn](https://yarnpkg.com/en/):

```bash
yarn
```

#### Testing

Run testrpc (ganache-cli) to provide a simulated EVM:

```bash
yarn testrpc
```

In a separate terminal, run the testuite:

```bash
yarn test
```

#### Linting

Lint all Solidity files with:

```bash
yarn lint
```

#### Static Analysis

Run static analysis tooling with:

```bash
yarn analyze
```

#### Deployment

Edit [truffle-config.js](truffle-config.js) according to your deployment plans, then run:

```bash
yarn run truffle deploy --network [network]
```
