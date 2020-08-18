pragma solidity 0.5.16;

contract todolist{
uint16 public tasks = 0; //count the tasks

struct Todo{
    uint16 id;
    string taskToPerform;
    bool isCompleted;
}

mapping (uint16 => Todo) public allTasks;  //map task number to Todo struct

constructor() public{
    listTask("Check your mails"); //default task to load while deployed
}


function listTask(string memory _task) public {
    tasks++;
    allTasks[tasks] = Todo(tasks, _task, false);
}



}