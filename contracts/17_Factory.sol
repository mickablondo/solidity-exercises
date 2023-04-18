// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Factory {
    monContrat[] mesContrats; // tableau de smart contract de type "monContrat"

    function creerNouveauContrat() external returns(address) {
        monContrat contrat = new monContrat(50);
        mesContrats.push(contrat);
        return address(contrat);
    }

    function getNombreByContrat(monContrat _contrat) external view returns(uint) {
        return _contrat.getNombre();
    }

    // la variable monContrat est en fait l'adresse du contrat de type monContrat déjà créé
    function setContratNombre(monContrat _contrat, uint _nombre) external {
        _contrat.setNombre(_nombre);
    }
}

contract monContrat {
    uint nombre;

    constructor(uint _nombre) {
        nombre = _nombre;
    }

    function setNombre(uint _nombre) external {
        nombre = _nombre;
    }

    function getNombre() external view returns(uint) {
        return nombre;
    }
}