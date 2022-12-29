// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;

contract Deposit{
    
    mapping(address=>uint256) public balances;

    function deposit(uint256 amount) public {
        
        balances[msg.sender] += amount;
        
    }

    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
 
    }

}   