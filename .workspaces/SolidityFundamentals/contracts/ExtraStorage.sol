// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; //solidity version

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {  // is:  Keyword for inheritence

     function store(uint256 _favNum) public override { //overrides the function
        favNum = _favNum + 5;
    }
}