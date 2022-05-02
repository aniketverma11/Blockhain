// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract MyToken is ERC1155, Ownable {
    uint public constant CHARLIZARD = 0;
    uint public constant PIKACHU = 10;
    uint public constant MUNSHI = 15;
    uint public constant MENDOR = 16;
    


    uint[] public supplies=[50,100,150];
    uint[] public minted = [0,0,0];
    uint[] public rates = [0.05 ether, 0.1 ether, 0.025 ether];
    constructor() ERC1155("https://api.website.com/token/{id}") {
        _mint(msg.sender, CHARLIZARD, 100, "");
        _mint(msg.sender, PIKACHU, 100, "");
        _mint(msg.sender, MUNSHI, 100, "");
        _mint(msg.sender, MENDOR, 100, "");
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(uint id, uint amount)
        public
        payable
        
    {
        require(id<=supplies.length, "Token doesn't exist");
        require(id>0, "Token doesn't exists");
        uint index = id-1;

        require(minted[index]+amount <= supplies[index], "Not enough supllies");
        require(msg.value>= amount * rates[index], "Not enough ether");
        _mint(msg.sender,id,amount, '');

        minted[index] += amount;
        supplies[index] -= amount;

    }


    function uri(uint _tokeId) override public view returns(string memory){
        return string(abi.encodePacked("https://api.website.com/token/link/",Strings.toString(_tokeId),".json"));
    }

    function withdraw() public onlyOwner{
        require(address(this).balance > 0, "not enugh balance");
        payable(owner()).transfer(address(this).balance);
    }
}
