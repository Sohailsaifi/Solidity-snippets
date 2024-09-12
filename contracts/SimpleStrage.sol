// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SimpleStorage {
    
    uint256 myFavouriteNumber; // 0

    // uint256[] listOfFavouriteNumbers;
    struct Person {
        uint256 favouriteNumber;
        string name;
    }

    // Person public pat = Person(7, "Pat");

    // Another way of defining the same thing:
    // Person public pat = Person({favouriteNumber: 7, name: "Pat"});
    // Person public mariah = Person({favouriteNumber: 7, name: "Mariah"});
    // Person public jon = Person({favouriteNumber: 7, name: "Jon"});

    // static array
    // Person[3] public listOfPeople; // []

    //dynamic array
    Person[] public listOfpeople; // []


    function store(uint256 _favouriteNumber) public {
        myFavouriteNumber = _favouriteNumber;
    }

    // view, pure

    function retrieve() public view returns(uint256) {
        return myFavouriteNumber;
    }

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        listOfpeople.push( Person(_favouriteNumber, _name));
    }
}
