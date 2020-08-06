contract booking{
   
    address payable private owner;
    uint8 public numberOfRooms;
    
    struct bookersDetail{
        string storage name;
        address _address;
        uint8 daysOfStay;
    }

    event bookedBy(string memory _name, address indexed _addr, uint indexed _payment);

//array to store rooms 
//map room number to bookers using count - this will be private - use if loops
// function to view room number for booker
// if he books again display error 
//  keep count of booked room, if exceeds throw error
//keep track of status, and in open function start countdown of days start once days expired keep as vacant


    
    enum statuses {vacant, occupied}
    statuses currentStatus;

    //passing number of rooms in the hotel by owner
    constructor(uint8 _numberOfRooms) public {
        owner = msg.sender;
        uint8 rooms[_numberOfRooms];

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