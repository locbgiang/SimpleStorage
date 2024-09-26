// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test, console} from "../../lib/forge-std/src/Test.sol";
import {DeploySimpleStorage} from "../../script/DeploySimpleStorage.s.sol";
import {SimpleStorage} from "../../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage public simpleStorage;

    function setUp() public {
        // use the DeploySimpleStorage script to deploy the contract
        DeploySimpleStorage deployScript = new DeploySimpleStorage();

        // Deploy the SimpleStorage contract before each test
        simpleStorage = deployScript.run();
    }

    function testStoreFavoriteNumber() public {
        uint256 expectNumber = 42;

        // call storeFavoriteNumber function
        simpleStorage.storeFavoriteNumber(expectNumber);

        // verify that the favorite number was stored correctly
        uint256 storedNumber = simpleStorage.viewFavoriteNumber();
        assertEq(storedNumber, expectNumber);
    }

    function testCreatePersion() public {
        string memory expectName = "John";
        uint256 expectFavoriteNumber = 16;

        // call createPerson function
        simpleStorage.createPerson(expectName, expectFavoriteNumber);

        // verify
        (string memory storedName, uint256 storedNumber) = simpleStorage
            .listOfPeople(0);
        assertEq(storedName, expectName);
        assertEq(storedNumber, expectFavoriteNumber);
    }
}
