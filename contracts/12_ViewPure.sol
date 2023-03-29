// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// @author MiK@
contract testMotsCles {

    /**
        VARIABLES
     */
    uint private nombreSecret; // PRIVATE (valeur par défaut) : variable utilisable seulement depuis l'intérieur du contrat
    uint public nombreAccessible; // PUBLIC variable :  variable utilisable depuis partout => crée une sorte de getter automatiquement
    uint internal nombreSecretMaisPastrop; // INTERNAL variable :  variable utilisable seulement depuis l'intérieur du contrat et depuis les contrats dérivés

    /**
        FONCTIONS
     */

    // PUBLIC : appel de la fonction depuis l'extérieur ou depuis l'intérieur
    // VIEW : venir récupérer une valeur et NON la changer => getters par exemple
    function getMyAddress() view public returns(address) {
        return msg.sender;
    }

    // PURE : juste pour faire des calculs
    function fois2(uint _nombre) pure public returns(uint) {
        return _nombre*2;
    }


    // PRIVATE : appel de la fonction depuis l'intérieur du contrat (norme : utiliser _ devant le nom de la fonction)
    function _secreteFois2() private {
        nombreSecret *= 2;
    }

    // INTERNAL : appel de la fonction depuis l'intérieur du contrat et depuis les contrats qui héritent de ce contrat (exemple : Owner)
    function _presqueSecretFois2() internal {
        nombreSecretMaisPastrop *= 2;
    }

    // EXTERNAL : appel de la fonction depuis l'extérieur du contrat seulement (et non pas depuis l'intérieur)
    function paiement() external payable {
        nombreAccessible = msg.value;
    }
}