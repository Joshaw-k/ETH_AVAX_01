// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    address public owner;
    uint256 public value;

    constructor() {
        owner = msg.sender;
        value = 0;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function setValue(uint256 _newValue) external onlyOwner {
        // Using require to check a condition
        require(_newValue > value, "New value must be greater than the current value");

        // Using assert to check an internal consistency condition
        assert(_newValue > 0);

        // Set the new value
        value = _newValue;
    }

    function triggerRevert(bool shouldRevert) external view onlyOwner returns (bool) {
        // Using revert to explicitly revert the transaction
        if (shouldRevert) {
            revert("This transaction is explicitly reverted");
        }

        return shouldRevert;
    }
}
