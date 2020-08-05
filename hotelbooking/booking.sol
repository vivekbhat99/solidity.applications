pragma solidity ^0.5.0;

contract roomBooking{
    
    uint public dateofArrival;
    address personBooked;
    
    
    address payable public owner;
    
    enum statuses {vacant, reserved, occupied}
    statuses currentStatus;
    
    event bookedBy(address indexed _add, uint indexed _payment);
    
    constructor() public {
        owner = msg.sender;
        currentStatus = statuses.vacant;
    }
    
    modifier isVacant {
        require(currentStatus == statuses.vacant,"The room is currently occupied :/");
        _;
    }
    
     
   function bookAroom(uint daysOfStay) payable public isVacant{
        require(msg.value==2 ether,"Insufficient ethers payment = ethers per day of stay");
        personBooked = msg.sender;
        owner.transfer(msg.value);
        currentStatus = statuses.reserved;
        emit bookedBy(msg.sender, msg.value);
    }
    
    function openRoom() public {
        require (msg.sender == personBooked, "you have not booked this :/");
        currentStatus = statuses.occupied;
    }
    
    
    
}
