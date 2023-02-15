// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../node_modules/@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "../node_modules/@openzeppelin/contracts/interfaces/IERC20.sol";

contract ZombieToken is ERC20 {
    //mint zombie tokens
    constructor(uint256 initialSupply) ERC20("ZombieToken", "ZTN") {
        _mint(msg.sender, initialSupply);
    }
}
