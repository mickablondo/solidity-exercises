// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

contract testGetterSetter {
    uint nombre;

    function getNombre() public view returns(uint) {
        return nombre;
    }

    function setNombre(uint _nombre) public {
        nombre = _nombre;
    }
}