
# Smart Contract: Require, Assert, and Revert

## Description
This Solidity demonstrates the use of `require()`, `assert()`, and `revert()` statements. Each statement is utilized in specific functions to handle validations, enforce internal invariants, and handle errors with meaningful messages.

## Features
1. **Deposit Function (`require`)**: Validates input and ensures funds are sent correctly.
2. **Withdraw Function (`assert`)**: Enforces internal logic for balance updates.
3. **Set Owner Function (`revert`)**: Handles invalid inputs with clear error messages.

## Usage
1. Deploy the contract using Remix or a local blockchain environment.
2. Test the following functions:
   - `deposit(uint256 amount)`
   - `withdraw(uint256 amount)`
   - `setOwner(address newOwner)`
3. Observe how `require()`, `assert()`, and `revert()` are used in different scenarios.

## Example
- **`require()`**: Ensures that deposit amounts are greater than zero.
- **`assert()`**: Confirms balance updates after a withdrawal.
- **`revert()`**: Prevents invalid owner addresses from being set.

## Setup Instructions
1. Clone this repository: `git clone <repo-url>`
2. Open in Remix (https://remix.ethereum.org/).
3. Deploy the contract on the Ethereum test network or local environment.
4. Interact with the contract using the provided functions.
