// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import '../.deps/npm/@openzeppelin/contracts/utils/Strings.sol'; // spécifier le chemin vers la dépendance String
import '../.deps/npm/@openzeppelin/contracts/utils/math/Math.sol'; // spécifier le chemin vers la dépendance Math

contract Libraries {

    function concat(string memory _string, uint256 _number) external pure returns (string memory) {
        string memory res = string(abi.encodePacked(_string, Strings.toString(_number))); // appel de la méthode toString de la dépendance Strings
        return res;
    }

    function average(uint a, uint b) external pure returns(uint) {
        return Math.average(a, b);
    }
}