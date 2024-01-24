// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 1️⃣ Create a new Player and save it to players mapping with the given data


contract User {
    struct Player {
        address playerAddress;
        string username;
        uint256 score;
    }

    mapping(address => Player) public players;

    function createUser(address userAddress, string memory username) external {
        // if user not signed up, address is 0, it requre address = 0 inorder to sign up
        //common use to check if the user is valid or already exist
        require(players[userAddress].playerAddress == address(0), "User already exists");

        // Create a new player here 👇

        Player memory newPlayer = Player({
            playerAddress: userAddress,
            username: username,
            score: 0
        }); 

        players[userAddress] = newPlayer;
    }
}