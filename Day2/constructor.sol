pragma solidity ^0.5.0;	

contract constructorExample {	

	string str;	

	constructor() public {				
		str = "GeeksForGeeks";	
	}	
	function getValue() public view returns (string memory) {	
		return str;	
	}	
}
