pragma solidity ^0.5.0;
contract booking{
    address payable private owner;
    uint8 public numberOfRooms;
    uint8 count = 0;
    struct bookersDetail{
        bytes32 name;
        uint8 roomNumber;
    }

    event bookedBy(bytes32 _name, address indexed _addr, uint indexed _payment);
    mapping (address => bookersDetail) roomBookedBy;
    address[] Rooms;

    //passing number of rooms in the hotel by owner and initializing it empty by 0;
    function enterNumberofRooms(uint8 _numberOfRooms) private {
        require(owner = msg.sender);
        uint8[] memory roomStatus = new uint8[](_numberOfRooms);
        for (uint8 i=0; i < roomStatus.length; i++) {
           roomStatus[i] = 0;
        }
      
    }
    
    //checks if atleast one room is empty by iterating array 
    modifier isVacant {
         require(
             count<numberOfRooms, "Oops! All rooms are filled :/" );
        _;
    }
    
   function bookAroom(bytes32 _name) payable public isVacant returns(uint8){  // output room number
        require(msg.value==2 ether,"Insufficient ethers payment = ethers per day of stay");
        owner.transfer(msg.value);
        uint8 _number;
        for (uint i = 0; i<roomStatus.length; i++){
            if(roomStatus(i) == 0){
                _number = roomStatus[i];
                break;
            }
        }
        count++;
        roomStatus[_number] = 1;
        var booker = roomBookedBy[msg.sender];
        booker.name = _name;
        booker.roomNumber = _number;
        Rooms.push(msg.sender);
        emit bookedBy(_name, msg.sender, msg.value, _number);
    }
    
    
    
    
}
