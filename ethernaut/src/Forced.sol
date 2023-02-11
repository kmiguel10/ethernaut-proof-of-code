//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Forced {
    constructor() public payable {
        selfdestruct(payable(0xACB09306B851Eb92AF7245bf4D83d85f569586bb));
    }
}
