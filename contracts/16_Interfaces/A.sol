// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// nécessite de compiler B.sol avant et de récupérer son adresse
import 'contracts/16_Interfaces/B.sol';

contract A {
    address addressB;
    
    function setAddressB(address _addressB) external {
        addressB = _addressB;
    }

    function appelGetNombre() external view returns(uint) {
        interfaceB b = interfaceB(addressB);
        return b.getNombre();
    }

    function appelSetNombre(uint _nombre) external {
        interfaceB b = interfaceB(addressB);
        b.setNombre(_nombre);
    }
}