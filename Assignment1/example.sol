// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./erc.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract foo is Ownable {
    using SafeMath for uint;

    Token MyToken; //= Token(0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99);
    uint256 public totalsupp;
    mapping (address => uint) public _balances;

    constructor (){
        MyToken = Token(0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99);

    }

 
    function getTotalsupply(uint amt) public payable{
       
        uint _supply =amt;
        MyToken.token(_supply);
    }

    function supply() 
    public
    returns(uint256){
        totalsupp = MyToken.totalSupply();
        return totalsupp;
    }

    function getAmntOnSender(address _addr) public view returns(uint256){
        //require(_exists());
        uint256 amnt = MyToken.balanceOf(_addr);
        return amnt;       
    }

    function getTransfer(address _to, uint _amount) public  payable{
        MyToken.transfer(_to,_amount);
    }

   function _getTokenAmount(uint _weiAmount) internal view returns (uint) {
        return _weiAmount.div(10 ** 18).mul(1);
    }

    //function get

    fallback() external payable {
        uint _amount = _getTokenAmount(msg.value);

        MyToken.transfer(msg.sender, _amount);
    }

    function mint(address account, uint256 amount) public payable {
        require(account != address(0), "ERC20: mint to the zero address");
        require(msg.value>=3,"Not enough ehther to mint this");
        totalsupp += amount;
        _balances[account] += amount;
    }

  }
