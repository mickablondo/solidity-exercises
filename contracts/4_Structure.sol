// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract testStructure {

    struct balance {
        uint money;
        uint numPayments;
    }
    // map pour assigner une adresse à un objet (struct)
    mapping(address => balance) Balances;

    function pay() external payable { // impossible de tester receive avec plugin remix sur vscode :'(
        Balances[msg.sender].money += msg.value;
        Balances[msg.sender].numPayments += 1;
    }

    // récupérer la valeur totale de ce qui a été envoyé par l'adresse qui interroge
    function getBalance() public view returns(uint) {
        return Balances[msg.sender].money;
    }

    // récupérer le nombre de paiements réalisés par l'adresse qui interroge
    function getNumPayments() public view returns(uint) {
        return Balances[msg.sender].numPayments;
    }
}