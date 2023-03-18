// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract sendMoney {
    address lastPerson;
    uint balance; // nombre total disponible sur le contrat intelligent

    function pay() external payable { // impossible de tester receive avec plugin remix sur vscode :'(
        lastPerson = msg.sender;
        balance = balance + msg.value;
    }

    function getLastPerson() public view returns(address) {
        return lastPerson;
    }

    function getBalance() public view returns(uint) {
        return balance;
    }
}