// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; //solidity version

import "./SimpleStorage.sol";

contract StorageFactory{

    SimpleStorage[] public simpleStorageArray;

    function createSimpleStorageContract() public{
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    function sfStore(uint256 index, uint256 num) public{
        // Address of contract
        // ABI - Application Binary Interface
        SimpleStorage simpleStorage = simpleStorageArray[index];
        simpleStorage.store(num);
    }

    function sfGet(uint256 index) public view returns(uint256){
        SimpleStorage simpleStorage = simpleStorageArray[index];
        return simpleStorage.retrieve();
    }
}