pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";

// import "@openzeppelin/contracts/access/Ownable.sol";
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {
    event SetPurpose(address sender, string purpose);

    struct Todo {
        string text;
        bool completed;
    }

    Todo[] public todos;

    string public purpose = "Building Unstoppable Apps!!!";
    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    mapping(address => uint256) public balanceOf;

    constructor() payable {
        // what should we do on deploy?
    }

    function setPurpose(string memory newPurpose) public payable {
        require(msg.value >= 0.01 ether);
        purpose = newPurpose;
        console.log(msg.sender, "set purpose to", purpose);
        emit SetPurpose(msg.sender, purpose);
    }

    function get(uint256 _index)
        public
        view
        returns (string memory text, bool completed)
    {
        Todo storage todo = todos[_index];
        return (todo.text, todo.completed);
    }

    function create(string calldata _text) public payable {
        require(msg.value >= 0.01 ether);
        todos.push(Todo(_text, false));
    }

    function toggleCompleted(uint256 _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }

    // to support receiving ETH by default
    receive() external payable {}

    fallback() external payable {}
}
