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
  event TaskCompleted(uint id, bool completed);

  constructor() {
    createTask("Etherum Blockchain Dapp");
  }

  function createTask(string memory _content)  public {
    taskCount++;
    tasks[taskCount] = Task(taskCount, _content, false);
    emit TaskCreated(taskCount, _content, false);
  }

  function setCompleted(uint _id) public {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;

    emit TaskCompleted(_id, _task.completed);
  }
}