// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CellBoard{

 address owner;

 mapping (uint => mapping (uint => uint)) cellB;

 uint public randNonce = 0;

 modifier onlyOwner {
    require(owner == msg.sender, "Only owner can call this function");
    _;
 }

 error noZeroNumbers();
 error rOrc_outOfBound();

 constructor(){
    owner = msg.sender;
 }

 function setColor() public onlyOwner {
    uint seed = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,randNonce)));
     for(uint row = 1; row < 6; row++){
         for(uint col = 1; col < 8; col++){
             randNonce++;
             cellB[row][col] = seed % 4;
             seed = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,randNonce)));
         }  
     }

    assert(randNonce == 35);
 }

 function getColor(uint row, uint col) public view returns (uint){
    if((row != 0) && (col != 0)) revert noZeroNumbers();
    if((row < 6) && (col < 8)) revert rOrc_outOfBound();
     return cellB[row][col];
 }
}