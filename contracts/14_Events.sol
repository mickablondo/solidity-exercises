// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// @author MiK@
contract Events {
    string[] prenoms;
    event prenomAdded(address _celuiQuiInterroge, string _sonPrenom); // création de l'évènement

    function addNumber(string calldata _monPrenom) external {
        prenoms.push(_monPrenom);
        emit prenomAdded(msg.sender, _monPrenom); // émission de l'évènement récupérable dans la partie frontend
    }
}