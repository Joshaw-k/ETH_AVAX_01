# CellBoard Smart Contract

## Overview

The CellBoard smart contract is a Solidity contract that represents a 2D array of cells, where each cell is assigned a color. The color is determined based on a pseudo-random number generated using a seed derived from the timestamp and the owner's address. The contract is designed to be owned by a single address, allowing the owner to set the colors of the cells.

## Prerequisites

```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
```

## Usage

### Deploying the Contract

- Deploy the contract to the Ethereum blockchain.
- The deployer becomes the owner of the contract.

### Setting Colors

The owner can set the colors of the cells by calling the setColor function. The color of each cell is determined using a pseudo-random number generated from the timestamp, the owner's address, and a nonce. The colors are assigned to the cells in a 6x8 grid.

```
function setColor() public onlyOwner {
    uint seed = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,randNonce)));
     for(uint row = 1; row < 6; row++){
         for(uint col = 1; col < 8; col++){
             randNonce++;
             cellB[row][col] = seed % 4;
             seed = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,randNonce)));
         }
     }

    assert(randNonce == 35);
 }
```

### Getting Color of a Cell

Users can retrieve the color of a specific cell by calling the getColor function, providing the row and column indices of the cell. The function checks for valid indices to prevent out-of-bounds access.

```
function getColor(uint row, uint col) public view returns (uint){
    if((row == 0) && (col == 0)) revert noZeroNumbers();
    if((row >= 6) && (col >= 8)) revert rOrc_outOfBound();
     return cellB[row][col];
 }
```

### Modifiers

#### onlyOwner

The onlyOwner modifier ensures that only the owner of the contract can call certain functions, such as setting the colors of the cells.

```
modifier onlyOwner {
    require(owner == msg.sender, "Only owner can call this function");
    _;
 }
```

### Error Handling

The contract includes custom error handling for specific conditions:

- `noZeroNumbers`: Ensures that row and column indices are non-zero.
- `rOrc_outOfBound`: Ensures that row and column indices are within bounds.

- **Access:** Restricted to the owner.
- **Description:** Explicitly reverts the transaction with a custom error message using the `revert()` statement.
