pragma solidity ^0.8.13 ;

contract Start {
    // fixed size types
    bool isnum ;
    uint a;
    uint b;
    address my_address;
    bytes32 Data;

    //variable size types
    string name;
    bytes Bytes;
    uint[] array;// initialize for array and contain only same datatype of elements into it
    mapping(uint => string) dictionary;


    //user define data type

    struct user {
        uint id;
        string name;
        uint[] friendIds;
    }
    enum Color {
        RED,
        GREEN,
        YELLOW

    }
}