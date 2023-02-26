// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; //solidity version

contract SimpleStorage { 

    //boolean, uint, int, address, byte
    //bool hasNum = true;

    uint256 favNum;

    mapping(string => uint256) public nameToNum; 

    function store(uint256 _favNum) public virtual{  //virtual makes it an overridable function
        favNum = _favNum;
    }

    struct People {
        uint256 favNum;
        string name;
    }

    People[] public people;

    //view, pure
    function retrieve() public view returns(uint256){
        return favNum;
    }

    function addPerson(string memory _name, uint256 _favNum) public{
        //People memory newPerson = People({favNum: _favNum, name: _name});
        people.push(People(_favNum,_name));
        nameToNum[_name] = _favNum;
    }
}