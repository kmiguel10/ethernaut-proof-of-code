//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "forge-std/Test.sol";

contract TestContract is Test {
    function test() external {
        vm.startBroadcast();
        uint8 a = 255;
        uint8 b = 1;
        console.log("The value of a + b: ", a + b);
        vm.stopBroadcast();
    }
}
