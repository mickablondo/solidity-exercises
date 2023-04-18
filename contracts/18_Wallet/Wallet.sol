// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import 'contracts/18_Wallet/Owner.sol'; // import du contrat Owner

contract Wallet is Owner { // hérite de Owner : gestion du propriétaire du contrat

    // objet décrivant un paiement : le montant et la date
    struct Payment {
        uint amount;
        uint timestamp;
    }

    // objet décrivant l'argent d'un utilisateur dans son wallet et la liste des dépôts effectués
    struct Balance {
        uint totalBalance;
        uint numPayments;
        mapping(uint => Payment) payments;
    }

    // on associe une Balance pour chaque utilisateur (adresse)
    mapping(address => Balance) Wallets;

    // dépôt d'argent
    receive() external payable {
        Payment memory myPayment = Payment(msg.value, block.timestamp); // pas stocké dans la blockchain mais juste en mémoire pour éviter de consommer du gas
        Wallets[msg.sender].totalBalance += msg.value;
        Wallets[msg.sender].payments[Wallets[msg.sender].numPayments] = myPayment;
        Wallets[msg.sender].numPayments++;
    }

    // récupérer le montant total déposé sur le smart contract
    function getBalance() public isOwner view returns(uint) { // isOwner : juste le propriétaire du smart contract peut déclencher cette fonction
        return address(this).balance;
    }

    // l'utilisateur veut récupérer tout son argent
    function withdrawAllMoney(address payable _to) public {
        uint amount = Wallets[msg.sender].totalBalance;
        Wallets[msg.sender].totalBalance = 0; // !!! Ne pas oublier de remettre à 0 !!!
        _to.transfer(amount);
    }

    // l'utilisateur veut récupérer une partie de son argent
    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= Wallets[msg.sender].totalBalance, "Not enough money");
        Wallets[msg.sender].totalBalance -= _amount;
        _to.transfer(_amount);
    }
}