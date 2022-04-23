//SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract MultiSigWallet {
    event Deposit (address indexed sender, uint amount);
    event Submit (uint indexed txId);
    event Approve (address indexed owner, uint indexed txId);
    event Revoke (address indexed owner, uint indexed txId);
    event Execute (uint indexed txId);

//define a struc that stores a transaction
    struct Transaction {
        address to;
        uint value;
        bytes data;
        bool executed;
    }

//store owners
address[] public owners;
    mapping (address => bool) public isOwner;
    //number of approves required for the transaction to be executed
    uint public requiredApprovals;

//now we'll store all transactions in a struct

Transaction[] public transactions;
mapping (uint => mapping(address=> bool)) public approved;

modifier onlyOwner(){
    require(isOwner[msg.sender], "not owner");
    //allow the execution of the rest of the function
    _;
}

constructor(address[] memory _owners, uint _required)  {
require(_owners.length >0, "owners required");
require(_required >0 && _required <= _owners.length, "required approvals must be greater than 0 and less than or equal to the number of owners");
for (uint i = 0; i < _owners.length; i++) {
    address owner= _owners[i];
    require(owner != address(0), "owner cannot be the zero address");
    isOwner[owner]= true;
    owners.push(owner);

}

requiredApprovals = _required;
}

receive () external payable{
    emit Deposit(msg.sender, msg.value);
}
function submit ( address _to, uint_value, bytes calldata _data){
    external 
    onlyOwner
}



}

