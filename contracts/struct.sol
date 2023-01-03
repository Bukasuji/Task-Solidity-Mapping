
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Deposit{
    
    mapping(address=>uint256) public balances;

    struct UserDetails {
        string name;
        uint age;
    }

   // UserDetails details array;
    UserDetails[] detailArr;
    
     // function to make deposit
    function deposit(uint256 amount) public {
        
        balances[msg.sender] += amount;
        
    }
   
    //function to check balance
    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
 
    }
     
     // function used to set details and pushed to the array
     function setUserDetails(string calldata name, uint256 age) public {
        detailArr.push(UserDetails(name, age));
    }
    
    // function fetches all stored details in the array
    function getDetail() public view  returns (UserDetails[] memory) {
        return detailArr;
        
    }
}   