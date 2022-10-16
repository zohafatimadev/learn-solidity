// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;
contract Student{
    
    event record(string   name,uint   rollNo,string city);
    
    address owner;
    
    struct StudentDetails{
        string   name;
        uint   rollNo;
        string   city;
    }

    mapping(uint=>StudentDetails) public details;

    constructor(){
        owner=msg.sender;
    }

    modifier onlyOwner(){
        require(owner==msg.sender,"you are not owner");
        _;
    }

    function addStudent(uint _reg,string memory _name,string memory _city) public  onlyOwner{
        details[_reg].rollNo = _reg;
        details[_reg].name = _name;
        details[_reg].city = _city;
        
        emit record( _name,_reg, _city);
     }

     function getStudent(uint _reg) public view returns (string memory,uint,string memory){
         return (details[_reg ].name,details[_reg ].rollNo,details[_reg ].city );
     }
}