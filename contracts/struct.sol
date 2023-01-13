
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Deposit{
    
    mapping(address=>uint256) public balances;
    mapping(string=>uint256) public kycDetails;

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
     
     // function used to set details and pushed to the array and mapping
     function setUserDetails(string calldata name, uint256 age) public {
        detailArr.push(UserDetails(name, age));
        kycDetails[name] = age;
    }
    
    // function fetches the age of the person calling it, once name is entered from mapping
    function getDetail(string memory name) public view  returns (uint) {
        return  kycDetails[name];
        
    }
}   