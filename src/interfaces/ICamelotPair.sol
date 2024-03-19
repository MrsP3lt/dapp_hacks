// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

interface ICamelotPair {
    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Burn(address indexed sender, uint256 amount0, uint256 amount1, address indexed to);
    event DrainWrongToken(address indexed token, address to);
    event FeePercentUpdated(uint16 token0FeePercent, uint16 token1FeePercent);
    event Mint(address indexed sender, uint256 amount0, uint256 amount1);
    event SetPairTypeImmutable();
    event SetStableSwap(bool prevStableSwap, bool stableSwap);
    event Skim();
    event Swap(
        address indexed sender,
        uint256 amount0In,
        uint256 amount1In,
        uint256 amount0Out,
        uint256 amount1Out,
        address indexed to
    );
    event Sync(uint112 reserve0, uint112 reserve1);
    event Transfer(address indexed from, address indexed to, uint256 value);

    function DOMAIN_SEPARATOR() external view returns (bytes32);
    function FEE_DENOMINATOR() external view returns (uint256);
    function MAX_FEE_PERCENT() external view returns (uint256);
    function MINIMUM_LIQUIDITY() external view returns (uint256);
    function PERMIT_TYPEHASH() external view returns (bytes32);
    function allowance(address, address) external view returns (uint256);
    function approve(address spender, uint256 value) external returns (bool);
    function balanceOf(address) external view returns (uint256);
    function burn(address to) external returns (uint256 amount0, uint256 amount1);
    function decimals() external view returns (uint8);
    function drainWrongToken(address token, address to) external;
    function factory() external view returns (address);
    function getAmountOut(uint256 amountIn, address tokenIn) external view returns (uint256);
    function getReserves()
        external
        view
        returns (uint112 _reserve0, uint112 _reserve1, uint16 _token0FeePercent, uint16 _token1FeePercent);
    function initialize(address _token0, address _token1) external;
    function initialized() external view returns (bool);
    function kLast() external view returns (uint256);
    function mint(address to) external returns (uint256 liquidity);
    function name() external view returns (string memory);
    function nonces(address) external view returns (uint256);
    function pairTypeImmutable() external view returns (bool);
    function permit(address owner, address spender, uint256 value, uint256 deadline, uint8 v, bytes32 r, bytes32 s)
        external;
    function precisionMultiplier0() external view returns (uint256);
    function precisionMultiplier1() external view returns (uint256);
    function setFeePercent(uint16 newToken0FeePercent, uint16 newToken1FeePercent) external;
    function setPairTypeImmutable() external;
    function setStableSwap(bool stable, uint112 expectedReserve0, uint112 expectedReserve1) external;
    function skim(address to) external;
    function stableSwap() external view returns (bool);
    function swap(uint256 amount0Out, uint256 amount1Out, address to, bytes memory data) external;
    function swap(uint256 amount0Out, uint256 amount1Out, address to, bytes memory data, address referrer) external;
    function symbol() external view returns (string memory);
    function sync() external;
    function token0() external view returns (address);
    function token0FeePercent() external view returns (uint16);
    function token1() external view returns (address);
    function token1FeePercent() external view returns (uint16);
    function totalSupply() external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}
