// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/access/Ownable.sol";

// Inherit from Ownable contract
contract Assignment9 is Ownable {
    // Create a public array called `deployedContracts` to store contract addresses
    address[] public deployedContracts;

    // Constructor that calls Ownable's constructor (optional, inherited by default)
    constructor() Ownable() {}

    // @dev Factory to deploy new instances of `SimpleContract`
    // Only the owner can call this function
    function createContract() external onlyOwner {
        // Deploy new instance of SimpleContract with any initial value
        SimpleContract newContract = new SimpleContract(123); // arbitrary initial value

        // Push the new deployed instance address to deployedContracts array
        deployedContracts.push(address(newContract));
    }
}

// Simple contract to be deployed by the factory
contract SimpleContract {
    uint256 public value;

    constructor(uint256 _initialValue) {
        value = _initialValue;
    }

    function setValue(uint256 newValue) external {
        value = newValue;
    }
}

