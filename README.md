# ERC20Helper

![Foundry CI](https://github.com/makerdao/dss-conduits/actions/workflows/ci.yml/badge.svg)
[![Foundry][foundry-badge]][foundry]
[![License: AGPL v3](https://img.shields.io/badge/License-AGPL%20v3-blue.svg)](https://github.com/makerdao/dss-conduits/blob/master/LICENSE)

**DISCLAIMER: Please do not use in production without taking the appropriate steps to ensure maximum security.**

**WARNING: Unlike other similar libraries, this  library does NOT REVERT ON FAILURES. Any contracts that inherit this code that expect the reversion to occur in this contract can have UNINTENDED AND POTENTIALLY CATASTROPHIC CONSEQUENCES.**

## Overview

ERC20Helper is a basic library designed to be used as a middleware between general smart contracts and diverse ERC-20 tokens. It standardizes the behaviours of all commonly used implementations.

The decision to intentionally not revert was so that this library can be more flexible for contracts that:
- Want to choose their own revert strings, or none at all (i.e. `require(asset.safeRransfer(msg.sender, amount), "FOO:FAILED_TRANSFER");`).
- Want to use the returns as booleans (i.e. `require(asset1.safeTransfer(msg.sender, amount) || asset2.safeTransfer(msg.sender, amount));`).
- Do not care about the result of a transfer.

## Setup

```sh
git clone git@github.com:maple-labs/erc20-helper.git
cd erc20-helper
forge install
```

## Testing

To run the tests, do the following:

```
forge test
```

## Bug Bounty

For all information related to the ongoing bug bounty for these contracts run by [Immunefi](https://immunefi.com/), please visit this [site](https://immunefi.com/bounty/maple/).

## Acknowledgements

These contracts were inspired by and/or directly modified from the following sources:

- [Maple Finance](https://github.com/maple-labs/erc20-helper/blob/main/src/ERC20Helper.sol) (this repo was forked from Maple Finance's repo).
- [Solmate](https://github.com/Rari-Capital/solmate)
- [OpenZeppelin](https://github.com/OpenZeppelin/openzeppelin-contracts)
- [Uniswap-v3](https://github.com/Uniswap/uniswap-v3-core/blob/main/contracts/libraries/TransferHelper.sol)
