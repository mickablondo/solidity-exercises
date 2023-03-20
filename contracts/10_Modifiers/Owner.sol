// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Owner { // contrat qui gère l'aspect propriétaire
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier isOwner() {
        require(msg.sender == owner, "Not the owner");
        _; // la fonction peut continuer
    }
}