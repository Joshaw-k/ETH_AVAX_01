// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TshirtMerch{

 address owner;

 struct Merchandize {
   string color;
   uint amount;
 }

 Merchandize[] public merchandize;

 uint public totalSupply = 40;

 uint public totalSold;

 modifier onlyOwner {
    require(owner == msg.sender, "Only owner can call this function");
    _;
 }

 error noZeroAmount();
 error emptyColor();

 constructor(){
    owner = msg.sender;
 }

 function buyMerch(string calldata _color, uint _amount) public {
   if(keccak256(abi.encode(_color)) == keccak256(abi.encode(""))){
      revert emptyColor();
   }
   if(_amount <= 0){
      revert noZeroAmount();
   }
   merchandize.push(Merchandize({color:_color,amount:_amount}));
   totalSupply = totalSold - _amount;
   totalSold = totalSold + _amount;
   assert(totalSold > 0);
 }

 function MerchSold() public onlyOwner view returns (Merchandize[] memory){
    return merchandize;
 }
}