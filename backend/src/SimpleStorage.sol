// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

contract SimpleStorage {
    uint256 favoriteNumber;

    constructor() {}

    struct person {
        string name;
        uint256 favoriteNumber;
    }

    person[] public listOfPeople;
    mapping(string name => uint256 favoriteNumber) public nameToFavoriteNumber;

    function storeFavoriteNumber(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function viewFavoriteNumber() public view returns (uint256) {
        return favoriteNumber;
    }

    function createPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(person(_name, _favoriteNumber));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
