// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import 'contracts/10_Modifiers/Owner.sol'; // import du contrat Owner

/*
Contrat ne gérant que la destruction.
A noter, la fonction selfdestruct est dépréciée depuis la version 0.8.18 : https://eips.ethereum.org/EIPS/eip-6049
*/
contract Killer is Owner {
    function destroy(address payable _to) public isOwner { // lorsque le contrat est détruit, on a la possibilité de transférer tous les fonds
        selfdestruct(_to); // les fonctions seront toujours accessibles mais ne fonctionneront plus
    }
}