// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Test, console} from "../../lib/forge-std/src/Test.sol";
import {DeploySimpleStorage} from "../../script/DeploySimpleStorage.s.sol";
import {SimpleStorage} from "../../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage public simpleStorage;

    function setUp() public {
        // Deploy the SimpleStorage contract before each test
        simpleStorage = new SimpleStorage();
    }

    function testStoreFavoriteNumber() public {
        uint256 expectNumber = 42;

        // call storeFavoriteNumber function
        simpleStorage.storeFavoriteNumber(expectNumber);

        // verify that the favorite number was stored correctly
        uint256 storedNumber = simpleStorage.viewFavoriteNumber();
        assertEq(storedNumber, expectNumber);
    }
}
