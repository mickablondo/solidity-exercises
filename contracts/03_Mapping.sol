// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract testMapping {

    // map pour assigner une adresse à une valeur
    mapping(address => uint) Balances ;

    function pay() external payable { // impossible de tester receive avec plugin remix sur vscode :'(
        if (Balances[msg.sender] > 0) { // ce 'if' évite une erreur
            Balances[msg.sender] = Balances[msg.sender] + msg.value; // montant en wei
        } else {
            Balances[msg.sender] = msg.value;
        }
    }

    // récupérer la valeur totale de ce qui a été envoyé avec l'adresse passée en paramètre
    function getBalance(address _address) public view returns(uint) {
        return Balances[_address];
    }
}