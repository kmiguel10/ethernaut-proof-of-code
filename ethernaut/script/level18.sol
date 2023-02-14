// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel18.sol";
import "forge-std/Script.sol";

contract POC is Script {
    MagicNum level18 = MagicNum(0xE74b670F9893C5eC16C689aEeA043f3b0844C070);

    function run() external {
        vm.startBroadcast();
        bytes
            memory code = "\x60\x0a\x60\x0c\x60\x00\x39\x60\x0a\x60\x00\xf3\x60\x2a\x60\x80\x52\x60\x20\x60\x80\xf3";

        //Solver contract
        address solver;
        //Create solver contract using assembly
        assembly {
            solver := create(0, add(code, 0x20), mload(code))
        }

        level18.setSolver(solver);

        vm.stopBroadcast();
    }
}
