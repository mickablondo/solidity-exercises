// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

// by Ben BK : https://www.youtube.com/watch?v=fLi70h1Vje8&list=PLBV4f2pTYexqgdiVpLOWlF-E5sTLPimot&index=15
contract GestionnaireEleve {
    address owner;

    struct Grade {
        string subject;
        uint grade;
    }

    struct Student {
        string firstName;
        string lastName;
        uint numberOfGrades;
        mapping(uint => Grade) grades;
    }

    mapping(address => Student) students;
    string[] matieres;

    constructor() {
        owner = msg.sender;

        // initialisation des matières
        matieres.push("math");
        matieres.push("francais");
        matieres.push("histoire");
        matieres.push("science");
    }

    function addStudent(address _studentAddress, string memory _firstName, string memory _lastName) public {
        require(msg.sender == owner, "Not the owner");

        // l'élève existe t-il déjà ?
        bytes memory firstNameOfAddress = bytes(students[_studentAddress].firstName); // bytes : comme string mais consomme moins de gaz
        require(firstNameOfAddress.length == 0, "Existe deja");

        // création de l'élève
        students[_studentAddress].firstName = _firstName;
        students[_studentAddress].lastName = _lastName;
    }

    function addGrade(address _studentAddress, uint _grade, string memory _subject) public {
        require(msg.sender == owner, "Not the owner");
        bytes memory firstNameOfAddress = bytes(students[_studentAddress].firstName);
        require(firstNameOfAddress.length > 0, "Il faut creer l'eleve");

        // ajout de la note
        students[_studentAddress].grades[students[_studentAddress].numberOfGrades].grade = _grade;
        // recherche de la matière et ajout
        for(uint i=0;i<matieres.length;i++){
            if(keccak256(bytes(matieres[i])) == keccak256(bytes(_subject))){
                students[_studentAddress].grades[students[_studentAddress].numberOfGrades].subject = matieres[i];
            }
        }
        students[_studentAddress].numberOfGrades++;
    }

    // récupérer les notes d'un élève
    function getGrades(address _studentAddress) public view returns(uint[] memory) {
        require(msg.sender == owner, "Not the owner");

        uint numberGradesThisStudent = students[_studentAddress].numberOfGrades;
        uint[] memory grades = new uint[](numberGradesThisStudent);
        for(uint i = 0 ; i < numberGradesThisStudent ; i++) {
            grades[i] = students[_studentAddress].grades[i].grade;
        }
        return grades;
    }
}