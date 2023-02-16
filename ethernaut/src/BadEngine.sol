// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BadEngine {
    function explode() external {
        selfdestruct(payable(address(0)));
    }
}
