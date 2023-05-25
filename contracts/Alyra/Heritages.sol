// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Parent {
    uint internal maVariable;
    
    function setValue(uint _newValue) external {
        maVariable = _newValue;
    }
}

contract Enfant is Parent { // is : permet de récupérer l'entièreté des fonctions de Parent
    function getVariableParent() external view returns(uint) {
        return maVariable;
    }
}

contract Caller {
    Enfant enfant = new Enfant(); // new : permet de déployer un nouveau contrat (= nouvelle instance)
    
    function testInheritance(uint _newValue) public returns(uint) {
        enfant.setValue(_newValue);
        return enfant.getVariableParent();
    }
}