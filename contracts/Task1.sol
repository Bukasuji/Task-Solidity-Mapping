// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
/**
 * This is a task from Growic Solidity Bootcamp
 * to list various data types in solidity and its use cases 
 */
contract DatatypesExamples {
    
    int256 public myNumber = -100; // Example of a signed integers
    uint256 public myOtherNum = 456; // Example of an unsigned integers
    bool public datatypeExamples = true; //Example of a boolean
    address public myAddress = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c; //address

    //enum and its use case
    enum Color { Blue, Violet }     
    Color myColor = Color.Blue;
    Color herColor = Color.Violet;

    bytes32 myByte = "growic"; //byte

}

    
