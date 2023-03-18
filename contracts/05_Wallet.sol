// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract testWallet {

    struct wallet {
        uint money;
        uint nbPaiements;
    }
    // map pour assigner une adresse à un objet (struct)
    mapping(address => wallet) Wallets;

    function pay() external payable { // impossible de tester receive avec plugin remix sur vscode :'(
        Wallets[msg.sender].money += msg.value;
        Wallets[msg.sender].nbPaiements += 1;
    }

    // récupérer le montant total
    function getTotalBalance() public view returns(uint) {
        return address(this).balance;
    }

    // l'utilisateur souhaite envoyer tout son argent
    function withdrawAllMoney(address payable _to) public {
        uint _amount = Wallets[msg.sender].money;
        _to.transfer(_amount);
        Wallets[msg.sender].money = 0;
    }

    // l'utilisateur souhaite récupérer tout son argent
    function withdrawAllMoney() public {
        uint _amount = Wallets[msg.sender].money;
        payable(msg.sender).transfer(_amount);
        Wallets[msg.sender].money = 0;
    }

    // l'utilisateur souhaite envoyer une partie de son argent
    function withdrawSomeMoney(address payable _to, uint _amount) public {
        if(_amount <= Wallets[msg.sender].money) {
            _to.transfer(_amount);
            Wallets[msg.sender].money -= _amount;
        }
    }

    // récupérer la valeur totale de ce qui a été envoyé par l'adresse qui interroge
    function getBalance() public view returns(uint) {
        return Wallets[msg.sender].money;
    }

    // récupérer le nombre de paiements réalisés par l'adresse qui interroge
    function getNumPayments() public view returns(uint) {
        return Wallets[msg.sender].nbPaiements;
    }
}