// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

// abstraction du contrat
interface Deployed {
    function set(uint num) external;
    function get() external view returns (uint);
}

/**
 * Recherche un contrat par son adresse et utilise ses méthodes définies dans l'interface
 * exemple :  0x65225eC10b966cF70bE296c909BfB5964f8fD498 => il faut se mettre sur le même réseau - Injected Provider Metamask - Testnet Goerli
 */
contract Existing  {    
    Deployed dc;
    
    function call(address _t) public {
        dc = Deployed(_t);
    }
 
    function getA() public view returns (uint result) {
        return dc.get();
    }
    
    function setA(uint _val) public returns (uint result) {
        dc.set(_val);
        return _val;
    }
}