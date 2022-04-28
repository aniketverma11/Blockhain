// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//pragma solidity ^0.4.2;

contract Token {
    string  public name;
    string  public symbol;
    string  public standard;
    uint256 public totalSupply;

    constructor(){
        name = "Aniket";
        symbol = "aNI";
        standard = "0.10.0";
    }

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
    );


    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowance;

    function balanceOf(address tokenOwner) external view returns (uint){
        return balances[tokenOwner];
    }

    function token (uint256 _initialSupply) external returns(uint) {
        balances[msg.sender] = _initialSupply;
        totalSupply = _initialSupply;
        return totalSupply;
    }

    function transfer(address receiver, uint256 numTokens) external returns (bool) {
        require(balances[msg.sender] >= numTokens);

        balances[msg.sender] -= numTokens;
        balances[receiver] += numTokens;

        emit Transfer(msg.sender, receiver, numTokens);

        return true;
    }

    function approve(address _spender, uint256 _value) external returns (bool success) {
        allowance[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);

        return true;
    }

    function transferFrom(address _from, address _to, uint256 numTokens) external payable returns (bool success) {
        require(numTokens <= balances[_from]);
        require(numTokens <= allowance[_from][msg.sender]);

        balances[_from] -= numTokens;
        balances[_to] += numTokens;

        allowance[_from][msg.sender] -= numTokens;

        emit Transfer(_from, _to, numTokens);

        return true;
    }
    
}
