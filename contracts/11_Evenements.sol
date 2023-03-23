// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Evenements {
    event transaction(address _from, address _to, uint _amount); // déclaration d'un évènement

    struct wallet {
        uint money;
    }
    // map pour assigner une adresse à un objet (struct)
    mapping(address => wallet) Wallets;

    function pay() external payable { // impossible de tester receive avec plugin remix sur vscode :'(
        Wallets[msg.sender].money += msg.value;
    }

    // récupérer la valeur totale de ce qui a été envoyé par l'adresse qui interroge
    function getBalance() public view returns(uint) {
        return Wallets[msg.sender].money;
    }

    // l'utilisateur souhaite envoyer une partie de son argent
    function withdrawSomeMoney(address payable _to, uint _amount) public {
        if(_amount <= Wallets[msg.sender].money) {
            _to.transfer(_amount);
            emit transaction(msg.sender, _to, _amount); // publication de l'évènement permettant de communiquer avec une interface utilisateur par exemple
            Wallets[msg.sender].money -= _amount;
        }
    }
}