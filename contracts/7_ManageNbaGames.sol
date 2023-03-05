// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract nbaGames {
    struct Team {
        string teamName;
        uint score;
    }

    struct NbaMatch { // TODO à revoir => plutôt partir sur un tableau de 'Team adverses' avec le score de chacun
        Team receivingTeam;
        Team visitorTeam;
        uint date;
    }

    mapping(address => NbaMatch) Matchs;

    function addMatch(string memory _receivingTeam, uint _scoreReceivingTeam, string memory _visitorTeam, uint _scoreVisitorTeam) public {
        Team memory receivingTeam = Team(_receivingTeam, _scoreReceivingTeam);
        Team memory visitorTeam = Team(_visitorTeam, _scoreVisitorTeam);
        Matchs[msg.sender].receivingTeam = receivingTeam;
        Matchs[msg.sender].visitorTeam = visitorTeam;
        Matchs[msg.sender].date = block.timestamp;
    }

    function getTheWinner(string memory _receivingTeam, string memory _visitorTeam) public view returns(string memory) {
        if(Matchs[msg.sender].receivingTeam.score > Matchs[msg.sender].visitorTeam.score) {

        }
    }
}