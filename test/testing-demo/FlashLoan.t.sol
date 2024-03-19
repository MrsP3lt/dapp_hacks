// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../../src/utils/Tokens.sol";
import "forge-std/console.sol";

import {AAVEV3FlashLoan} from "../../src/utils/AAVEV3FlashLoan.sol";
import {MakerDAOFlashLoan} from "../../src/utils/MakerDAOFlashLoan.sol";
import {UniswapV2FlashLoan} from "../../src/utils/UniswapV2FlashLoan.sol";
import {UniswapV3FlashLoan} from "../../src/utils/UniswapV3FlashLoan.sol";

enum FlashLoanProviders {
    NONE,
    AAVEV3,
    MAKERDAO,
    UNISWAPV2,
    UNISWAPV3
}

library FlashLoanProvider {
    /**
     * @dev Allows a user to take a flash loan from a specified FlashloanProvider
     * @param flp The flash loan provider to take the loan from
     * @param tokens The addresses of the tokens to borrow
     * @param amounts The amounts of the tokens to borrow
     */
    function takeFlashLoan(FlashLoanProviders flp, address[] memory tokens, uint256[] memory amounts) internal {
        if (flp == FlashLoanProviders.AAVEV3) {
            AAVEV3FlashLoan.takeFlashLoan(tokens, amounts);
        } else if (flp == FlashLoanProviders.UNISWAPV2) {
            UniswapV2FlashLoan.takeFlashLoan(tokens, amounts);
        } else {
            revert("FlashLoanProvider: Provider doesn't support multiple token flash loans");
        }
    }

    /**
     * @dev Allows a user to take a flash loan from a specified FlashloanProvider
     * @param flp The flashloan provider to take the loan from
     * @param token The address of the token to borrow
     * @param amount The amount of the token to borrow
     */
    function takeFlashLoan(FlashLoanProviders flp, address token, uint256 amount) internal {
        if (flp == FlashLoanProviders.AAVEV3) {
            AAVEV3FlashLoan.takeFlashLoan(token, amount);
        } else if (flp == FlashLoanProviders.MAKERDAO) {
            MakerDAOFlashLoan.takeFlashLoan(token, amount);
        } else if (flp == FlashLoanProviders.UNISWAPV2) {
            UniswapV2FlashLoan.takeFlashLoan(token, amount);
        } else if (flp == FlashLoanProviders.UNISWAPV3) {
            UniswapV3FlashLoan.takeFlashLoan(token, amount);
        } else {
            revert("FlashLoanProvider: Provider doesn't support single token flash loans");
        }
    }

    /**
     * @dev Pay back the flash loan to the specified flashloan provider
     * @param flp The flashloan provider to pay the loan back to
     */
    function payFlashLoan(FlashLoanProviders flp) internal {
        if (flp == FlashLoanProviders.AAVEV3) {
            AAVEV3FlashLoan.payFlashLoan(msg.data);
        } else if (flp == FlashLoanProviders.MAKERDAO) {
            MakerDAOFlashLoan.payFlashLoan(msg.data);
        } else if (flp == FlashLoanProviders.UNISWAPV2) {
            UniswapV2FlashLoan.payFlashLoan(msg.data);
        } else if (flp == FlashLoanProviders.UNISWAPV3) {
            UniswapV3FlashLoan.payFlashLoan(msg.data);
        } else {
            revert("FlashLoanProvider: Flash loan provider not supported");
        }
    }

    /**
     * @dev Gets the bytes4 function selector for the intended flash loan callback
     * @param flp The flashloan provider to get the callback selector of
     */
    function callbackFunctionSelector(FlashLoanProviders flp) internal pure returns (bytes4) {
        if (flp == FlashLoanProviders.AAVEV3) {
            return AAVEV3FlashLoan.CALLBACK_SELECTOR;
        } else if (flp == FlashLoanProviders.MAKERDAO) {
            return MakerDAOFlashLoan.CALLBACK_SELECTOR;
        } else if (flp == FlashLoanProviders.UNISWAPV2) {
            return UniswapV2FlashLoan.CALLBACK_SELECTOR;
        } else if (flp == FlashLoanProviders.UNISWAPV3) {
            return UniswapV3FlashLoan.CALLBACK_SELECTOR;
        } else {
            return bytes4(0);
        }
    }

    /**
     * @dev Gets the bytes32 return data for the intended flash loan callback
     * @param flp The flashloan provider to get the return data of
     */
    function returnData(FlashLoanProviders flp) internal pure returns (bytes memory) {
        if (flp == FlashLoanProviders.MAKERDAO) {
            return MakerDAOFlashLoan.RETURN_DATA;
        } else if (flp == FlashLoanProviders.AAVEV3) {
            return AAVEV3FlashLoan.RETURN_DATA;
        } else {
            return new bytes(0);
        }
    }
}

abstract contract FlashLoan {
    using FlashLoanProvider for FlashLoanProviders;

    /**
     * @dev Flash loan provider call stack
     */
    FlashLoanProviders[] internal _flps;

    /**
     * @dev Allows a user to take a flash loan from a specified FlashloanProvider
     * @param flp The flash loan provider to take the loan from
     * @param tokens The addresses of the tokens to borrow
     * @param amounts The amounts of the tokens to borrow
     */
    function takeFlashLoan(FlashLoanProviders flp, IERC20[] memory tokens, uint256[] memory amounts) internal virtual {
        address[] memory tkns = new address[](tokens.length);
        for (uint256 i = 0; i < tokens.length; i++) {
            console.log(
                ">>> Taking flashloan of %s %s from FlashLoanProviders[%s]",
                amounts[i],
                address(tokens[i]),
                uint256(flp)
            );
            tkns[i] = address(tokens[i]);
        }
        _flps.push(flp);
        flp.takeFlashLoan(tkns, amounts);
    }

    /**
     * @dev Allows a user to take a flash loan from a specified FlashloanProvider
     * @param flp The flash loan provider to take the loan from
     * @param tokens The addresses of the tokens to borrow
     * @param amounts The amounts of the tokens to borrow
     */
    function takeFlashLoan(FlashLoanProviders flp, address[] memory tokens, uint256[] memory amounts)
        internal
        virtual
    {
        for (uint256 i = 0; i < tokens.length; i++) {
            console.log(
                ">>> Taking flashloan of %s %s from FlashLoanProviders[%s]", amounts[i], tokens[i], uint256(flp)
            );
        }
        _flps.push(flp);
        flp.takeFlashLoan(tokens, amounts);
    }

    /**
     * @dev Allows a user to take a flash loan from a specified FlashloanProvider
     * @param flp The address of the flash loan provider to take the loan from
     * @param token The address of the token to borrow
     * @param amount The amount of the token to borrow
     */
    function takeFlashLoan(FlashLoanProviders flp, IERC20 token, uint256 amount) internal virtual {
        takeFlashLoan(flp, address(token), amount);
    }

    /**
     * @dev Allows a user to take a flash loan from a specified FlashloanProvider
     * @param flp The address of the flash loan provider to take the loan from
     * @param token The address of the token to borrow
     * @param amount The amount of the token to borrow
     */
    function takeFlashLoan(FlashLoanProviders flp, address token, uint256 amount) internal virtual {
        console.log(">>> Taking flashloan of %s %s from FlashLoanProviders[%s]", amount, token, uint256(flp));
        _flps.push(flp);
        flp.takeFlashLoan(token, amount);
        _flps.pop();
    }

    /**
     * @dev Returns the top most provider from the call stack
     * @return flp The current flash loan provider context
     */
    function currentFlashLoanProvider() internal view returns (FlashLoanProviders flp) {
        if (_flps.length > 0) {
            return _flps[_flps.length - 1];
        }
        return FlashLoanProviders.NONE;
    }

    /**
     * @dev Executes the attack logic for the flash loan
     */
    function _executeAttack() internal virtual;

    /**
     * @dev Completes the attack logic and finalizes the flash loan
     */
    function _completeAttack() internal virtual;

    function _fallback() internal virtual {
        console.log(">>> Execute attack");
        _executeAttack();
        if (_flps.length > 0) {
            FlashLoanProviders flp = currentFlashLoanProvider();
            if (flp.callbackFunctionSelector() == bytes4(msg.data[:4])) {
                console.log(">>> Attack completed successfully");
                _completeAttack();
                console.log(">>> Pay back flash loan");
                flp.payFlashLoan();
                bytes memory returnData = flp.returnData();
                assembly {
                    let len := mload(returnData)
                    return(add(returnData, 0x20), len)
                }
            }
        }
    }

    /**
     * @dev Fallback function that executes the attack logic, pays back the flash loan, and finalizes the attack
     * @dev First checks if there are any flash loans on the call stack
     * @dev Verifies the function selector matches the current providers callback function selector
     */
    fallback() external payable virtual {
        _fallback();
    }

    receive() external payable virtual {
        _fallback();
    }
}

contract FlashLoanTemplate is FlashLoan, Test {
    function initiateAttack() external {
        // Take flash loan on some token
        deal(address(EthereumTokens.DAI), address(this), 900_000 * 1e18);
        takeFlashLoan(FlashLoanProviders.UNISWAPV2, address(EthereumTokens.DAI), 100 ether);
    }

    function _executeAttack() internal override {
        // Execute attack and use flash loaned funds here
    }

    function _completeAttack() internal override {
        // Finish attack
        // This function is called after the flash loan is repayed
    }
}

contract FlashLoanTest is Test {
    uint256 mainnetFork;

    FlashLoanTemplate public flashLoanTemplate;

    function setUp() public {
        mainnetFork = vm.createSelectFork("mainnet", 17_626_926);
        flashLoanTemplate = new FlashLoanTemplate();
    }

    function testFlashLoan() public {
        flashLoanTemplate.initiateAttack();
    }
}
