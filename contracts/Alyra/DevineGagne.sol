// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract DevineGagne is Ownable {

    struct Joueur {
        bool isReferenced;
        bool hasPlayed;
    }
    string mot;
    string public indice;
    mapping(address => Joueur) joueurs;
    address[] recordedAddresses;
    address public winner;

    // TODO à améliorer : gameFinish

    function setMot(string memory _mot) external onlyOwner {
        mot = _mot;
    }

    function setIndice(string memory _indice) external onlyOwner {
        indice = _indice;
    }

    function addJoueur(address _address) external onlyOwner {
        require(!joueurs[_address].isReferenced, unicode"Déjà dans la liste des joueurs.");

        joueurs[_address].isReferenced = true;
        recordedAddresses.push(_address);
    }

    function propose(string memory _mot) external returns(bool) {
        require(joueurs[msg.sender].isReferenced, unicode"T'as pas le droit de jouer.");
        require(!joueurs[msg.sender].hasPlayed, unicode"T'as pas le droit de rejouer.");

        joueurs[msg.sender].hasPlayed = true;
        if(keccak256(abi.encodePacked(_mot)) == keccak256(abi.encodePacked(mot)) ) {
            winner = msg.sender;
            return true;
        }
        return false;
    }

    function reset() external onlyOwner {
        mot = "";
        indice = "";
        winner = address(0);

        for(uint i = 0; i < recordedAddresses.length; i++) {
            delete(joueurs[recordedAddresses[i]]);
        }

        delete recordedAddresses;
    }
}