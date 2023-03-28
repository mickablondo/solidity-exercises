// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// @author MiK@
contract testMotsCles {
    // view : venir récupérer une valeur et NON la changer => getters par exemple
    // pure : juste pour faire des calculs

    // private : appel de la fonction depuis l'intérieur du contrat (norme : utiliser _ devant le nom de la fonction)
    // private variable (défaut) : variable utilisable seulement depuis l'intérieur du contrat

    // internal : appel de la fonction depuis l'intérieur du contrat et depuis les contrats qui héritent de ce contrat (exemple : Owner)
    // internal internal :  variable utilisable seulement depuis l'intérieur du contrat et depuis les contrats dérivés

    // external : appel de la fonction depuis l'extérieur du contrat seulement (et non pas depuis l'intérieur)

    // public : appel de la fonction depuis l'extérieur ou depuis l'intérieur
    // public variable :  variable utilisable seulement depuis partour (exemple : uint public nombre) => crée une sorte de getter automatiquement
}