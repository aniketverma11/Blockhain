pragma solidity ^0.5.0;  
contract Types {  

    uint[6] data;    
       
    // Defining function to 
    // assign values to array
    function array_example() public payable returns (uint[6] memory){  
        data = [uint(10), 20, 30, 40, 50, 60];
        return data;  
  } 
  function array_element() public payable returns (uint){  
        uint x = data[2];
        return x;  
  }  
}