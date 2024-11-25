// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RequireAssertRevert {
    address public owner;
    uint public balance;

    constructor() {
        owner = msg.sender;
        balance = 0;
    }

    // Deposit function with require()
    function deposit(uint amount) public payable {
        require(amount > 0, "Deposit amount must be greater than zero");
        require(msg.value == amount, "Ether sent must match the deposit amount");

        balance += amount;
    }

    // Withdraw function with assert()
    function withdraw(uint amount) public {
        assert(msg.sender == owner); // Only owner can withdraw
        
        uint newBalance = balance - amount;
        assert(newBalance >= 0); // Ensure balance cannot go negative

        balance = newBalance;
        payable(owner).transfer(amount);
    }

    // Set new owner function with revert()
    function setOwner(address newOwner) public {
        require(msg.sender == owner, "Only the owner can change ownership");
        if (newOwner == address(0)) {
            revert("New owner address cannot be zero");
        }

        owner = newOwner;
    }
}
