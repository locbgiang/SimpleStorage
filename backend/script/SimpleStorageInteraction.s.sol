// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract SimpleStorageInteraction is Script {
    uint256 constant FAVORITE_NUMBER = 42;

    function storeFavoriteNumber(address simpleStorageAddress) public {
        // Interact with the SimpleStorage contract to store a favorite number
        SimpleStorage simpleStorage = SimpleStorage(simpleStorageAddress);
        simpleStorage.storeFavoriteNumber(FAVORITE_NUMBER);
    }

    function viewFavoriteNumber(address simpleStorageAddress) public view {
        // Interact with the SimpleStorage contract to view the stored favorite number
        SimpleStorage simpleStorage = SimpleStorage(simpleStorageAddress);
        uint256 storedNumber = simpleStorage.viewFavoriteNumber();
        console.log("Stored favorite number is:", storedNumber);
    }

    function createPerson(
        address simpleStorageAddress,
        string memory _name,
        uint256 _favoriteNumber
    ) public {
        // Interact with the SimpleStorage contract to create a person
        SimpleStorage simpleStorage = SimpleStorage(simpleStorageAddress);
        simpleStorage.createPerson(_name, _favoriteNumber);
    }

    function getPersonFromList(
        address simpleStorageAddress,
        uint256 index
    ) public view {
        // Access the public array 'listOfPeople' using the index
        SimpleStorage simpleStorage = SimpleStorage(simpleStorageAddress);
        (string memory name, uint256 favoriteNumber) = simpleStorage
            .listOfPeople(index);

        // Console log the person information from the array
        console.log(
            "Person at index %s, name = %s, Favorite number = %s",
            index,
            name,
            favoriteNumber
        );
    }

    function run() external {
        // Define the address of the deployed SimpleStorage contract
        address simpleStorageAddress = 0x5FbDB2315678afecb367f032d93F642f64180aa3;

        // Start broadcasting the transaction
        vm.startBroadcast();

        // Store favorite number
        storeFavoriteNumber(simpleStorageAddress);

        // View the stored favorite number
        viewFavoriteNumber(simpleStorageAddress);

        // Create a person with the name 'Alice' and favorite number 25
        createPerson(simpleStorageAddress, "Alice", 25);

        // Access Alice (index 0, as she's the first person created in the array)
        getPersonFromList(simpleStorageAddress, 0);

        // Stop broadcasting the transaction
        vm.stopBroadcast();
    }
}
