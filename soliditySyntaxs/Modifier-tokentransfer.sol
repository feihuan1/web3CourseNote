// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract PausableToken {
    address public owner;
    bool public paused;
    mapping(address => uint) public balances;

    constructor() {
        //this owner msg.sender is the one at beginning when contract deploy
        owner = msg.sender;
        paused = false;
        balances[owner] = 1000;
    }

    modifier onlyOwner() {
        // 1️⃣ Implement the modifier to allow only the owner to call the function 
        //this msg.sender and owner is the one calling the function
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    // 2️⃣ Implement the modifier to check if the contract is not paused 
    modifier notPaused() {
        require(!paused,"The contract is paused");
        _;
    }

    // apply modifier to the contract
    function pause() public onlyOwner {
        paused = true;
    }

    function unpause() public onlyOwner {
        paused = false;
    }

    // 3️⃣ use the notPaused modifier in this function 
    function transfer(address to, uint amount) public notPaused {
        //!!! confusing part , if balance is gtreater than amount, it will proceed, otherwise, throw error msg!!!
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}
