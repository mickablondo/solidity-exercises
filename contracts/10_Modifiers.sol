// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import './10_Owner.sol'; // import du contrat Owner

contract Modifiers is Owner { // contrat Modifiers hérite du contrat Owner
    uint nombre;

    function setNombre(uint _nombre) public isOwner { // on appelle le modifier, inutile de remettre un require
        nombre = _nombre;
    }

    function getNombre() public view isOwner returns(uint) { // on appelle le modifier, inutile de remettre un require
        return nombre;
    }
}