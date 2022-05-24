// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

interface IMyErc721{
    function balanceOf(address owner) external view returns (uint256 balance);
    function ownerOf(uint256 tokenId) external view returns (address owner);
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;
    function approve(address to, uint256 tokenId) external;
    function setApprovalForAll(address operator, bool _approved) external;
    function Mint(address to, uint256 tokenId) external;
}

interface IMyErc20{
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address from,  address to, uint256 amount) external returns (bool);

}

contract Nft is Ownable{
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    address token20;
    address token721;
    uint256 public rate = 100 * 10 ** 18;
    


    function setAdress(address _token20, address _token721) public {
        token20 = _token20;
        token721 = _token721;
    }

    function Mint() public{

        require(IMyErc20(token20).balanceOf(msg.sender) >0, "Insufficient Amount");

        IMyErc20(token20).transferFrom(msg.sender, address(this), rate);
        //tokenAddress.transferFrom(msg.sender, address(this), rate);
        
        uint tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        //_safeMint(msg.sender, tokenId);
        
        IMyErc721(token721).Mint(msg.sender,tokenId);
    
    }
    
    function withdrawToken() public onlyOwner {
        IMyErc20(token20).transfer(msg.sender, IMyErc20(token20).balanceOf(address(this)));
    }
}
