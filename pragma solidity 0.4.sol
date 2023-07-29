pragma solidity 0.4.11;

contract Token {
    mapping(address => uint256) public balance;
    address public creator;
    
    event Transfer(address indexed from, address indexed to, uint256 value);
    
    constructor() {
        creator = msg.sender;
        balance[creator] = 200;
    }

    modifier hasEnoughBalance(uint256 amount) {
        require(balance[msg.sender] >= amount, "Insufficient balance");
        _;
    }

    function transfer(address to, uint256 amount) public hasEnoughBalance(amount) {
        balance[msg.sender] -= amount;
        balance[to] += amount;
        emit Transfer(msg.sender, to, amount);
    }

    function getBalance() public constant returns (uint256) {
        return balance[msg.sender];
    }
}