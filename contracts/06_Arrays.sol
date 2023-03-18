// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract testArrays {
    uint[] nombre; // storage (extérieur d'une fonction) : bloqué dans la blockchain

    // ajout
    function addValue(uint _valeur) public {
        nombre.push(_valeur);
    }

    // mise à jour
    function updateValue(uint _valeur, uint _index) public {
        nombre[_index] = _valeur;
    }

    // suppression
    function deleteValue(uint _index) public {
        delete nombre[_index];
    }

    // lire
    function getValue(uint _index) public view returns(uint) {
        return nombre[_index];
    }

    // création d'un tableau de double en parcourant le tableau nombre
    function getNombreX2() public view returns(uint[] memory) {
        uint longueur = nombre.length;
        uint[] memory nombreX2 = new uint[](longueur);// memory : non persisté sur la blockchain => il faut spécifier la longueur du tableau
        for(uint i=0 ; i < longueur ; i++) {
            nombreX2[i] = nombre[i] * 2;
        }
        return nombreX2;
    }

    // Fonction avec un tableau passé en paramètre, qui ajoute le total des éléments de ce tableau dans le tableau nombre
    function somme(uint[] memory _monTableau) public returns(uint[] memory) {
        uint total = 0;
        for(uint i=0 ; i < _monTableau.length ; i++) {
            total += _monTableau[i];
        }
        addValue(total);
        return nombre;
    }
}