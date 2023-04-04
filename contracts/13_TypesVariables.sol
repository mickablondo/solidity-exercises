// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/*
storage - la variable est une variable d'état (stockée sur la blockchain)
memory - la variable est en mémoire et existe pendant l'appel d'une fonction
calldata - emplacement de données spécial contenant des arguments de fonction
*/

// @author MiK@
contract testTypes {
    uint nombre; // automatiquement en mode storage car en dehors des fonctions
    uint[] public monArray; // public pour permettre de vérifier les valeurs du tableau modifiées dans doSomething

    function doSomething() external {
        monArray.push(2);
        monArray.push(3);
        uint[] storage nouvelArray = monArray; // nouvelArray pointe sur monArray => même emplacement de stockage
        uint[] memory autreNouvelArray = monArray; // memory est oublié à la fin de la fonction
        nouvelArray[0] = 0; // 0 va prendre la place de "2" du premier push dans monArray
        autreNouvelArray[0] = 12; // NE remplace PAS monArray[0]
    }

    function autre(uint[] calldata _users) external { // on doit mettre calldata car fonction external

    }
}