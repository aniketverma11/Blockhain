//SPDX-Identifier-License: MIT

pragma solidity ^0.8.4;

interface IErcToken{
    function Mint(address _minter, uint amount) external;
    function transferFrom(address from,  address to, uint256 amount) external returns (bool);
}

contract basiccon{
    address conadd;
    uint rate = 1 ether;

    function setAdrr(address _addr) public {
        conadd = _addr;
    }

    function Minttok() public payable{
        require(msg.value==1, "not sufficiant ether to mint");
        //require(valu)
        uint amount = 100;
        IErcToken(conadd).transferFrom(msg.sender, address(this), rate);
        IErcToken(conadd).Mint(msg.sender,amount);
    }

    function showAdd() public view returns(address){
        return(conadd);
    }

    function onlyLoc() public pure returns(uint){
        uint a = 11;
        return(a);
    }

}
