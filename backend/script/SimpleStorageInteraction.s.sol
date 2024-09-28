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

    function viewFavoriteNumber(address simpleStorageAddress) public {
        // Interact with the SimpleStorage contract to view the stored favorite number
        SimpleStorage simpleStorage = SimpleStorage(simpleStorageAddress);
        uint256 storedNumber = simpleStorage.viewFavoriteNumber();
        console.log("Stored favorite number is:", storedNumber);
    }
}
