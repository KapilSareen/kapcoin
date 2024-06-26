// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.24;

interface IERC20{
  function transfer(address to, uint256 value) external  returns (bool) ;
  function balanceOf(address account) external view returns (uint256);
  
}
  
contract Faucet{
  address payable owner;
  IERC20 public token;
  uint public withdrawlAmount=50*(10**18);


  uint public lockTime= 1 minutes;
  mapping(address=>uint) CooldownPeriod;

  event Withdrawl(address to, uint amount);
  event Deposit(address from, uint amount);

  constructor(address tokenAddress) payable{
    token=IERC20(tokenAddress);
    owner=payable(msg.sender);
  }

  function requestTokens() public{
    require(msg.sender!=address(0));
    require(token.balanceOf(address(this))>=withdrawlAmount, "Insufficient Balance in Faucet!");
    require(block.timestamp >= CooldownPeriod[msg.sender],"Wait before next try");
    token.transfer(msg.sender, withdrawlAmount);
    CooldownPeriod[msg.sender] = block.timestamp + lockTime;
  }
  
  receive() external payable{
   emit Deposit(msg.sender, msg.value); 
  }


  function getBalance() external view returns (uint){
  return  token.balanceOf(address(this));
  }

  function setLocktime(uint amount) public onlyOwner{
    lockTime=amount*1 minutes;
  }

  function setWithdrawl(uint amount) public onlyOwner{
   withdrawlAmount= amount*(10**18);
  }

  function withdrawl() external onlyOwner{
  emit Withdrawl(owner, token.balanceOf(address(this)));
  token.transfer(owner, token.balanceOf(address(this)));
  }

  modifier onlyOwner(){
    require(msg.sender==owner, "Only Owner can call this function");
    _;
  }

  
}