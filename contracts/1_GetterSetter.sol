// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract testGetterSetter {
    // différents types
    uint unsignedNombre;
    int nombre;
    bool estCeVrai;
    address etherAddress;
    string maPhrase;

    function getUnsignedNombre() public view returns(uint) {
        return unsignedNombre;
    }

    function setUnsignedNombre(uint _unsignedNombre) public {
        unsignedNombre = _unsignedNombre;
    }

    function getNombre() public view returns(int) {
        return nombre;
    }

    function setNombre(int _nombre) public {
        nombre = _nombre;
    }
    
    function getEstCeVrai() public view returns(bool) {
        return estCeVrai;
    }

    function setEstCeVrai(bool _estCeVrai) public {
        estCeVrai = _estCeVrai;
    }
 
    function getEtherAddress() public view returns(address) {
        return etherAddress;
    }

    function setEtherAddress(address _etherAddress) public {
        etherAddress = _etherAddress;
    }   
    
    function getMaPhrase() public view returns(string memory) {
        return maPhrase;
    }

    function setMaPhrase(string memory _maPhrase) public {
        maPhrase = _maPhrase;
    }
}