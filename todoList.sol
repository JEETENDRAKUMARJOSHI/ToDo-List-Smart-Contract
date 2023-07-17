// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract TodoList{

    struct todoItems{
        
        string name;
        string descriptions;
        string author;
        bool isCompleted;
    }

    mapping(uint=>todoItems) public todo;

    uint count = 0;
    address owner;

    event taskCompleted (uint indexed id);

    constructor(){
         owner = msg.sender;
    }

    modifier onlyOwner(){
        require(owner == msg.sender, "Only Owner can perform this action ..");
        _;
    }

    function createTask(string calldata _name, string calldata _descriptions, string calldata _author) public onlyOwner{
        
        todoItems memory Items = todoItems({

            name : _name,
            descriptions : _descriptions,
            author : _author,
            isCompleted : false
        });
        todo[count] = Items;
        count ++;
        emit taskCompleted(count);
    }

    function taskCompletion(uint id) public onlyOwner{
        
        if(!todo[id].isCompleted){
            todo[id].isCompleted =true;
        }
    }
}
