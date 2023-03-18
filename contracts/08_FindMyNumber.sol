// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract FindMyNumber {

    uint nombre;
    address owner;
    bool maintenance; // par défaut valeur false

    constructor() { // exécuté au déploiement du smart contract
        owner = msg.sender;
    }

    function setNombre(uint _nombre) public {
        require(msg.sender == owner, "Seul le proprietaire du smart contract peut agir."); // rend le gas, sert à valider les données transmises
        require(!maintenance, "Le contrat est en maintenance, le jeu est en pause.");

        if(_nombre < 0) {
            // arrêt de l'exécution de la fonction et rend le gas prévu pour cette fonction
            revert('Le nombre ne peut pas etre inferieur a 0.');
        }
        
        nombre = _nombre;
        assert(nombre == _nombre ); // ne rend pas le gas, sert à auditer un contrat, à ne pas trop utiliser (et plutôt à la fin de la fonction)
    }

    function findNumber(uint _nombre) public view returns(bool) {
        if(nombre == _nombre) {
            return true;
        }
        return false;
    }

    function setMaintenance(bool _maintenance) public {
        require(msg.sender == owner, "Seul le proprietaire du smart contract peut agir.");
        maintenance = _maintenance;
    }

    function destroy(address payable _to) public { // lorsque le contrat est détruit, on a la possibilité de transférer tous les fonds
        require(msg.sender == owner, "Seul le proprietaire du smart contract peut agir.");
        selfdestruct(_to); // les fonctions seront toujours accessibles mais ne fonctionneront plus
    }
}