// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import 'contracts/10_Modifiers/Killer.sol'; // import du contrat Killer 

contract Modifiers is Killer { // contrat Modifiers hérite du contrat Killer qui importe lui-même le contrat Owner
    uint nombre;

    function setNombre(uint _nombre) public isOwner { // on appelle le modifier, inutile de remettre un require
        nombre = _nombre;
    }

    function getNombre() public view isOwner returns(uint) { // on appelle le modifier, inutile de remettre un require
        return nombre;
    }
}