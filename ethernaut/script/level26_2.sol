// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel26.sol";
import "forge-std/Script.sol";

contract POC is Script {
    DoubleEntryPoint level26 =
        DoubleEntryPoint(0xf8F62366090AF765b4B49e1aF1783E48cE7f3e2e);

    function run() external {
        vm.startBroadcast();

        level26.forta().setDetectionBot(
            0x64cD76648a8B527Bc9D93A623d496e1FEC9fcCA4
        );

        vm.stopBroadcast();
    }
}
