// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Counter {
    uint public count = 0;

    // Need to pay GAS fee for write functions because they modify the blockchain
    function incrementCount() public {
        count++;
    }
}