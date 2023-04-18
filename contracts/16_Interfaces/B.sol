// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// interface  : pratique pour faire communiquer 2 smart contracts entre eux
interface interfaceB {
    function getNombre() external view returns(uint);
    function setNombre(uint _nombre) external;
}

contract B {
    uint nombre;

    function getNombre() external view returns(uint) {
        return nombre;
    }

    function setNombre(uint _nombre) external {
        nombre = _nombre;
    }
}