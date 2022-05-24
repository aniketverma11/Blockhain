//SPDX-Identifier-License: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/ownership/Ownable.sol";

contract ErcToken is ERC20,Ownable{
    constructor() ERC20("ERC_20", "ERC"){
    }
    function Mint(address _minter, uint amount) external onlyOwner{
        _mint(_minter, amount);
    }
}
