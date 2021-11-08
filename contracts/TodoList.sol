pragma solidity ^0.8.9;

contract TodoList {
  uint public taskCount = 0;

  struct Task {
    uint id;
    string content;
    bool completed;
  }

  mapping(uint => Task) public tasks;

  event TaskCreated(uint id, string content, bool completed);

  constructor() {
    createTask("Etherum Blockchain Dapp");
  }

  function createTask(string memory _content)  public {
    taskCount++;
    tasks[taskCount] = Task(taskCount, _content, false);
    emit TaskCreated(taskCount, _content, false);
  }
}