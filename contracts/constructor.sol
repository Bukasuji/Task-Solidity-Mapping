// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;

contract A {
    address public owner;
    uint FEE;

    constructor (uint _fee) {
        FEE = _fee;
        owner = msg.sender;

    }
}

contract B is A {
     
    constructor() A(20) {
        owner = msg.sender;
    }
}


