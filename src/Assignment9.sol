// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// import Openzeppelin Ownable contract

// inherit from Ownable contract 
contract Assignment9 is Ownable {
    // create a public array called `deployedContracts` to store contracts addresses in it 
    address[] public deployedContracts;

    // call Ownable constructor of openzeppelin contract
    constructor() Ownable() {}


    // @dev Factory to deploy new instances of `SimpleContract`
    // make only the owner is the one who can call this function
    function createContract() external onlyOwner {
        // deploy new instance of SimpleContract
            // Hint: When you create a new instance, do not forget to pass any arbitrary initial value in the constructor
        SimpleContract newContract = new SimpleContract(123); // arbitrary initial value

        // push the new deployed instance to deployedContracts array
        deployedContracts.push(address(newContract));
    }

    function getContractsCount() external view returns (uint256) {
        return deployedContracts.length;
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
