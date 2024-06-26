// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; 
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract KapCoin is ERC20Capped, ERC20Burnable, Ownable{
uint public blockReward;

 constructor(uint256 cap, uint256 reward) 
        ERC20("KapCoin", "KPT") 
        ERC20Capped(cap * (10 ** decimals())) 
        Ownable(msg.sender)
    {
        _mint(msg.sender, 1000 * (10 ** decimals()));
        blockReward = reward * (10 ** decimals());
    }
    
function _mintMinerReward() internal{
    _mint(block.coinbase, blockReward);
}
function _update(address from, address to, uint value)internal virtual override(ERC20, ERC20Capped) {
if(from !=address(0) && to != block.coinbase && block.coinbase !=address(0)){
_mintMinerReward();
}
super._update(from, to, value);
}



function setBlockReward(uint reward) public onlyOwner{
   blockReward=reward*(10**decimals());
}

}