# MyContract

## Overview

This smart contract, named `MyContract`, is a basic Ethereum smart contract written in Solidity. It demonstrates the usage of `require()`, `assert()`, and `revert()` statements, common in Ethereum smart contract development to enforce conditions, ensure internal consistency, and handle explicit transaction reversals.

## Contract Details

### Owner

The contract has an owner, initially set to the address that deploys the contract. The `onlyOwner` modifier is implemented to restrict certain functions to be callable only by the owner.

### State Variables

- `owner`: The address of the contract owner.
- `value`: An unsigned integer variable that can be updated by the owner.

### Functions

#### `constructor()`

- Initializes the contract, setting the deployer's address as the owner and `value` to 0.

#### Modifier: `onlyOwner`

- Ensures that only the owner can execute functions with this modifier.

#### `setValue(uint256 _newValue)`

- **Access:** Restricted to the owner.
- **Parameters:** `_newValue` - New value to set.
- **Description:** Sets the contract's `value` to the provided `_newValue` if it is greater than the current value. Utilizes `require()` for external conditions and `assert()` for internal consistency.

#### `triggerRevert()`

- **Access:** Restricted to the owner.
- **Description:** Explicitly reverts the transaction with a custom error message using the `revert()` statement.

## Usage

1. Deploy the contract to an Ethereum network.
2. Interact with the contract using an Ethereum wallet or through a decentralized application (DApp).
