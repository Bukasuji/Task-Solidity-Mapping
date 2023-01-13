// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;

contract Deposit{

    uint256 private constant FEE = 3;
    error InvalidAmount (uint256 sent, uint256 minRequired);
    
    mapping(address=>uint256) public balances;
    mapping(string=>uint256) public kycDetails;
    address public owner;
    
    struct UserDetails {
        string name;
        uint age;
    }

    //UserDetails details array
    UserDetails[] detailArr;
    
    //a modifier to specify owner of conract
    modifier isOwner {
        require(owner == msg.sender);
        _;
    }

    // modifier to specify that it is the right address that increases their fund
    modifier increaseDeposit {
        require(balances[msg.sender] > 0, "you have 0 balance, deposit first before increasing your deposit");
        _;
    }

    // a modifier that ensures user pays the right fee
    modifier value(uint amt ) {
         if (amt != FEE) {
             revert InvalidAmount({
                 sent: amt,
                 minRequired: FEE
             });
         } else {
             _;
         }

    }


     // function to make deposit
    function deposit(uint256 amount) public {
        
        balances[msg.sender] += amount;
        
    }

    //function to increase fund, it has two modifiers
    function addfund(uint amount) public increaseDeposit value(FEE) {
        balances[msg.sender] += amount;
    }

    //function to check balance
    function checkBalance() public view returns (uint256) {
        return balances[msg.sender];
 
    }

    //function to withdraw deposit
    function withdraw(uint256 amount) public isOwner  {
        require(balances[msg.sender] >= amount,  "insufficient fund, please reduce amount");
        
        balances[msg.sender] -= amount;

    }

   // function used to set user details and pushed to the array
   function setUserDetails(string calldata name, uint256 age) public {
        detailArr.push(UserDetails(name, age));
        kycDetails[name] = age;
    }
    
   // function fetches all stored details in the array
    function getDetail(string memory name) public view  returns ( uint) {
        return  kycDetails[name];
        
    }

}   