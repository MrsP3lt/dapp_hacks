// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Test.sol";
import "forge-std/interfaces/IERC20.sol";
import {Ownable2Step, Ownable} from "@openzeppelin/contracts/access/Ownable2Step.sol";
/* 
    Attack Template One
*/

/*
    ## Key Info
        - Project: 
        - Description:
        - Date: 
        - Value Lost:
        - Vulnerability:
        - [Attacker]()
        - [Attack Contract]()
        - [Vulnerable Contract]()
        - [Attack Tx]()
        -:[Twitter]()
*/

contract AttackContract is Ownable2Step {

    constructor(address initialOwner) Ownable(initialOwner) {}

    function initiateAttack() external view onlyOwner {
        require(msg.sender == owner(), "caller is not owner");
        // Initiate attack
    }

    function _executeAttack() internal {
        // Execute attack and use flash loaned funds here
    }

    function _completeAttack() internal {
        // Finish attack
    }

    fallback() external payable {}

    receive() external payable {}

    function withdraw(uint256 _amount) external onlyOwner {
        payable(msg.sender).transfer(_amount);
    }

}

contract TestAttackContract is Test {

    AttackContract public attackContract;

    function setUp() public {
        // vm.createSelectFork("bsc", 30248637);
        // Fund Attack Address
        attackContract = new AttackContract(msg.sender);
    }

    function testFlashLoan() public view {
        attackContract.initiateAttack();
    }

}
