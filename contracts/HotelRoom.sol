// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {

    enum Statuses { 
        Vacant, 
        Occupied 
        }

    Statuses public currentStatus;

    event Occupy(address _occupant, uint _value);

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier onlyWhileVacant {
        // Check status
        require(currentStatus == Statuses.Vacant, "Currently occupied.");
        _;
    }
    
    modifier costs(uint _amount) {
        // Check price
        require(msg.value >= _amount, "Not enough ether provide."); 
        _;
    }

    function book() public payable onlyWhileVacant costs(2 ether) {
        currentStatus = Statuses.Occupied;
        
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(sent);

        emit Occupy(msg.sender, msg.value);
    }
}