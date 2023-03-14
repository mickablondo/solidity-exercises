// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// @author MiK@
contract nbaGames {

    // exemple d'un ENUM => renvoi un uint qui correspond à l'emplacement du résultat
    enum resultMatch {gagne, perdu, inconnu}

    struct nbaMatch {
        string _teamName;
        nbaGames.resultMatch _resultMatch;
        uint date;
    }

    mapping(address => nbaMatch[]) Matchs; // mapping <adress_sender ; liste de résultats>

    function addResultMatch(string memory _adverseTeam, uint _scoreTeam, uint _scoreAdverseTeam) public {
        nbaMatch memory m;
        if(_scoreTeam > _scoreAdverseTeam) {
            m = nbaMatch(_adverseTeam, resultMatch.gagne, block.timestamp); // exemple pour gestion du temps (now)
        } else {
            m = nbaMatch(_adverseTeam, resultMatch.perdu, block.timestamp);
        }

        Matchs[msg.sender].push(m);
    }

    function getResultMatch(string memory _adverseTeam) public view returns(resultMatch) {
        uint i;
        for(i=0; i<Matchs[msg.sender].length; i++) { // boucle for
            if(keccak256(bytes(Matchs[msg.sender][i]._teamName)) == keccak256(bytes(_adverseTeam))) { // comparaison de strings
                return Matchs[msg.sender][i]._resultMatch;
            }
        }
        return resultMatch.inconnu;
    }
}