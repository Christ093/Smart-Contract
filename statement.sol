// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RequireAssertRevert {
    address public owner;
    uint256 public balance;

    constructor() {
        // Set the contract deployer as the owner
        owner = msg.sender;
    }

    // Function that uses `require()` to validate inputs
    function deposit(uint256 amount) public payable {
        require(amount > 0, "Amount must be greater than zero");
        require(msg.value == amount, "Sent value must match the deposit amount");
        balance += amount;
    }

    // Function that uses `assert()` to check internal logic
    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "Only the owner can withdraw");
        require(amount <= balance, "Insufficient balance");
        
        // Check invariant
        uint256 oldBalance = balance;
        balance -= amount;
        payable(owner).transfer(amount);

        // Assert that the new balance is correctly updated
        assert(balance == oldBalance - amount);
    }

    // Function that uses `revert()` to handle conditional exceptions
    function setOwner(address newOwner) public {
        if (newOwner == address(0)) {
            revert("New owner address cannot be zero");
        }
        owner = newOwner;
    }
}
