// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract MokokoFactory {

    event MokokoCreated(uint id, string name, uint dna);

    uint dnaDigits = 4;
    uint dnaModulus = 10 ** dnaDigits;

    struct Mokoko {
        string name;
        uint dna;
    }

    Mokoko[] public mokokos;
    
    function _createMokoko(string memory _name, uint _dna) private {
        uint id = mokokos.push(Mokoko(_name, _dna)) - 1;
        emit MokokoCreated(id, _name, _dna);
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    function createRandomMokoko(string memory _name) public {
        uint randDna = _generateRandomDna(_name);
        _createMokoko(_name, randDna);
    }
}