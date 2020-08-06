contract booking{
   
    address payable private owner;
    uint8 public numberOfRooms;
    
    struct bookersDetail{
        string storage name;
        address _address;
        uint8 daysOfStay;
    }

//array to store rooms 
//

    enum statuses {vacant, reserved, occupied}
    statuses currentStatus;

    event bookedBy(string memory _name, address indexed _addr, uint indexed _payment);
    
    //passing number of rooms in the hotel by owner
    constructor(uint8 _numberOfRooms) public {
        owner = msg.sender;
        numberOfRooms = _numberOfRooms;
       //change below line to array ie all rooms vacant
       // currentStatus = statuses.vacant;
    }
    
    modifier isVacant {
        require(currentStatus == statuses.vacant,"The room is currently occupied :/");
        _;
    }
    
     
   function bookAroom(string memory _name, uint _daysOfStay) payable public isVacant{
        require(msg.value==2 ether,"Insufficient ethers payment = ethers per day of stay");
        personBooked = msg.sender;
        owner.transfer(msg.value);
        currentStatus = statuses.reserved;
        emit bookedBy(_name, msg.sender, msg.value);
    }
    
    function openRoom() public {
        require (msg.sender == personBooked, "you have not booked this :/");
        currentStatus = statuses.occupied;
    }
    
    
    
}