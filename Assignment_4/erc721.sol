// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
//import "@openzeppelin/contracts/utils/Ownable.sol";

contract MyErc721 is ERC721{
    using Counters for Counters.Counter;
    //uint256 public rate = 100 * 10 ** 18;
    constructor() ERC721("MyToken", "MTK") {       
    }
    function Mint(address to, uint256 tokenId) public {
        _safeMint(to, tokenId);
    }
}
