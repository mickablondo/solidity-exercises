// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract Notation is Ownable {

    enum Subjects {
        biology,
        math,
        french
    }

    struct Student {
        string name;
        uint noteBiology;
        uint noteMath;
        uint noteFr;
    }

    struct Teacher {
        bool isReferenced;
        Subjects subject;
    }
    
    mapping(address => Teacher) teachers;
    mapping(address => Student) students;
    address[] class;

    modifier existsSubject(uint _subject) {
        require(_subject < uint(type(Subjects).max), unicode"La matière demandée n'existe pas.");
        _;
    }

    function addTeacher(address _address, uint _subject) external onlyOwner existsSubject(_subject) {
        require(!teachers[_address].isReferenced, unicode"Déjà référencé");

        teachers[_address].isReferenced = true;
        teachers[_address].subject = Subjects(_subject);
    }

    function addNote(address _addressStudent, string memory _studentName, uint note) external {
        require(note <= 20, unicode"Mauvais système de notation");
        require(teachers[msg.sender].isReferenced, unicode"T'es pas un prof !");

        if(keccak256(abi.encodePacked(students[_addressStudent].name)) == keccak256(abi.encodePacked(""))) {
            class.push(_addressStudent);
        }

        uint _tmpNoteBio  = students[_addressStudent].noteBiology;
        uint _tmpNoteMath = students[_addressStudent].noteMath;
        uint _tmpNoteFr   = students[_addressStudent].noteFr;

        if(teachers[msg.sender].subject == Subjects.biology) {
            students[_addressStudent] = Student(_studentName, note, _tmpNoteMath, _tmpNoteFr);
        } else if(teachers[msg.sender].subject == Subjects.math) {
            students[_addressStudent] = Student(_studentName, _tmpNoteBio, note, _tmpNoteFr);
        } else if(teachers[msg.sender].subject == Subjects.french) {
            students[_addressStudent] = Student(_studentName, _tmpNoteBio, _tmpNoteMath, note);
        }
    }

    function getNote(address _addressStudent, uint _subject) external view existsSubject(_subject) returns(uint) {
        if(_subject == uint(Subjects.biology)) {
            return students[_addressStudent].noteBiology;
        }
        if(_subject == uint(Subjects.math)) {
            return students[_addressStudent].noteMath;
        }
        if(_subject == uint(Subjects.biology)) {
            return students[_addressStudent].noteFr;
        }
        revert();
    }

    function getAverageByStudent(address _address) public view returns(uint) {
        require(keccak256(abi.encodePacked(students[_address].name)) != keccak256(abi.encodePacked("")), unicode"L'élève n'existe pas.");
        return (students[_address].noteBiology + students[_address].noteMath + students[_address].noteFr) / 3;
    }

    function getAverageClassBySubject(uint _subject) external view returns(uint) {
        uint totalNotes;
        for(uint i=0; i<class.length; i++) {
            if(_subject == uint(Subjects.biology)) {
                totalNotes += students[class[i]].noteBiology;
            }
            if(_subject == uint(Subjects.math)) {
                totalNotes += students[class[i]].noteMath;
            }
            if(_subject == uint(Subjects.biology)) {
                totalNotes += students[class[i]].noteFr;
            }
        }
        return totalNotes / class.length;
    }

    function getAverageClass() external view returns(uint) {
        uint totalAverages;
        for(uint i=0; i<class.length; i++) {
            totalAverages += (students[class[i]].noteBiology + students[class[i]].noteMath + students[class[i]].noteFr) / 3;
        }
        return totalAverages / class.length;
    }

    function isStudentOk(address _address) external view returns(bool) {
        return getAverageByStudent(_address) >= 10;
    }
}