// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; //solidity version

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "./PriceConverter.sol";

contract FundMe{

    using PriceConverter for uint256;

    uint256 public minUsd = 50 * 1e18;

    address[] public funders;
    mapping(address => uint256) public Amount;
    address public owner;

    constructor(){
            owner = msg.sender;
        }

    function fund() public payable{
        require(msg.value.getConversionRate() >= minUsd, "Not enough"); // 1e18 = 1 * 10 ** 18
        funders.push(msg.sender);
        Amount[msg.sender] += msg.value; 
    }

    
    function withdraw() public onlyOwner {

        

        for(uint256 index=0; index < funders.length; index++){
            address funder = funders[index];
            Amount[funder] = 0;
        }
        funders = new address[](0); // reset the array

        /*payable(msg.sender).transfer(address(this).balance); //transfer method for sending ether to contracts

        bool verify = payable(msg.sender).send(address(this).balance);
        require(verify,"Send Failed");  //send method*/

        (bool success,) = payable(msg.sender).call{value: address(this).balance}("");
        require(success,"Call Failed");  //call method
    }

    modifier onlyOwner{
        require(msg.sender == owner, "Sender not owner");
        _; // execute code functions after require
    }
}