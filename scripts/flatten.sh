#!/bin/sh

set -ex

rm -rf temp
mkdir -p temp

alias flatten="yarn run truffle-flattener"

flatten contracts/StateswapAtomicizer.sol --output temp/StateswapAtomicizer.sol
flatten contracts/StateswapRegistry.sol --output temp/StateswapRegistry.sol
flatten contracts/StateswapExchange.sol --output temp/StateswapExchange.sol
flatten contracts/StateswapVerifier.sol --output temp/StateswapVerifier.sol
