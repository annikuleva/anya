pragma solidity 0.4.11;

contract Token {
    mapping(address => uint) public balance;

    function Token() public {
        balance[msg.sender] = 200;
    }

    function transferTokens(uint amount, address recipient) public {
        require(balance[msg.sender] >= amount);
        require(balance[recipient] + amount >= balance[recipient]);

        balance[msg.sender] -= amount;
        balance[recipient] += amount;
    }
}

contract Token {
    mapping(address => uint256) private balances;

    function getBalance(address account) public view returns(uint256) {
        return balances[account];
    }
}

/*
- Мы использовали версию компилятора 0.4.11, как рекомендовано.
- Структура контракта начинается с функции конструктора Token(), которая присваивает 200 токенов создателю. Верификатор public гарантирует, что баланс будет доступен через getter функцию.
- Функция transferTokens позволяет передавать токены с баланса одного пользователя на баланс другого. Она принимает два параметра - количество передаваемых токенов и адрес получателя. Функция проверяет, достаточно ли токенов на балансе отправителя перед выполнением передачи.
- Модификатор public у переменной balance создает автоматическую getter функцию для доступа к балансу пользователя.

- Это базовый пример, и ты можешь добавлять и изменять его в соответствии с твоими требованиями.
*/
