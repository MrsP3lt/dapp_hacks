// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/interfaces/IERC20.sol";
import "../interfaces/IUniswapV2Router.sol";
import "../interfaces/IUniswapV2Factory.sol";
import "../interfaces/IUniswapV3Router.sol";

import "../interfaces/IUniswapV3Factory.sol";
/* 
| No  | Chain     | Dex                        |
| --- | --------- | -------------------------- |
| 1   | Ethereum  | UNIV2,UNIV3,CUR,AAV3,PCAKE |
| 2   | Arbitrum  | UNIV3,CUR,AAV3             |
| 3   | Optimism  | UNIV3,CUR,AAV3             |
| 4   | Polygon   | UNIV3,CUR,AAV3             |
| 5   | BSC       | PCAKE                      |
| 6   | Celo      | UNIV3,CUR                  |
| 7   | Avalanche | UNIV3,CUR                  |
| 8   | Fantom    | CUR,AAV3                   |
| 9   | Harmony   | CUR,AAV3                   |
| 11  | Moonbeam  | CUR                        |
| 12  | Aurora    | CUR                        |
| 13  | Gnosis    | CUR                        |
| 14  | Metis     | AAV3                       |
| 15  | Aptos     | PCAKE                      |
| 16  | Linea     | PCAKE                      |
| 17  | PolygonZk | PCAKE                      |
*/

library EthereumTokens {
    IUniswapV2Router public constant UNISWAP_V2_ROUTER = IUniswapV2Router(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
    IUniswapV2Factory public constant UNISWAP_V2_FACTORY = IUniswapV2Factory(0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f);
    IUniswapV3Router public constant UNISWAP_V3_ROUTER = IUniswapV3Router(0xE592427A0AEce92De3Edee1F18E0157C05861564);
    // Top 50 tokens by market cap on etherscan
    IERC20 public constant ETH = IERC20(0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE);
    IERC20 public constant WETH = IERC20(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
    IERC20 public constant USDT = IERC20(0xdAC17F958D2ee523a2206206994597C13D831ec7);
    IERC20 public constant BNB = IERC20(0xB8c77482e45F1F44dE1745F52C74426C631bDD52);
    IERC20 public constant USDC = IERC20(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
    IERC20 public constant BUSD = IERC20(0x4Fabb145d64652a948d72533023f6E7A623C7C53);
    IERC20 public constant MATIC = IERC20(0x7D1AfA7B718fb893dB30A3aBc0Cfc608AaCfeBB0);
    IERC20 public constant OKB = IERC20(0x75231F58b43240C9718Dd58B4967c5114342a86c);
    IERC20 public constant stETH = IERC20(0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84);
    IERC20 public constant wstETH = IERC20(0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0);
    IERC20 public constant anyLTC = IERC20(0x0aBCFbfA8e3Fda8B7FBA18721Caf7d5cf55cF5f5);
    IERC20 public constant THETA = IERC20(0x3883f5e181fccaF8410FA61e12b59BAd963fb645);
    IERC20 public constant SHIB = IERC20(0x95aD61b0a150d79219dCF64E1E6Cc01f0B64C4cE);
    IERC20 public constant DAI = IERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);
    IERC20 public constant HEX = IERC20(0x2b591e99afE9f32eAA6214f7B7629768c40Eeb39);
    IERC20 public constant UNI = IERC20(0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984);
    IERC20 public constant LEO = IERC20(0x2AF5D2aD76741191D15Dfe7bF6aC92d4Bd912Ca3);
    IERC20 public constant WBTC = IERC20(0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599);
    IERC20 public constant LINK = IERC20(0x514910771AF9Ca656af840dff83E8264EcF986CA);
    IERC20 public constant QNT = IERC20(0x4a220E6096B25EADb88358cb44068A3248254675);
    IERC20 public constant APE = IERC20(0x4d224452801ACEd8B2F0aebE155379bb5D594381);
    IERC20 public constant CRO = IERC20(0xA0b73E1Ff0B80914AB6fe0444E65848C4C34450b);
    IERC20 public constant LDO = IERC20(0x5A98FcBEA516Cf06857215779Fd812CA3beF1B32);
    IERC20 public constant NEAR = IERC20(0x85F17Cf997934a597031b2E18a9aB6ebD4B9f6a4);
    IERC20 public constant VEN = IERC20(0xD850942eF8811f2A866692A623011bDE52a462C1);
    IERC20 public constant FRAX = IERC20(0x853d955aCEf822Db058eb8505911ED77F175b99e);
    IERC20 public constant aAAVE = IERC20(0xba3D9687Cf50fE253cd2e1cFeEdE1d6787344Ed5);
    IERC20 public constant stkAAVE = IERC20(0x4da27a545c0c5B758a6BA100e3a049001de870f5);
    IERC20 public constant TUSD = IERC20(0x0000000000085d4780B73119b644AE5ecd22b376);
    IERC20 public constant USDP = IERC20(0x8E870D67F660D95d5be530380D0eC0bd388289E1);
    IERC20 public constant SAND = IERC20(0x3845badAde8e6dFF049820680d1F14bD3903a5d0);
    IERC20 public constant HT = IERC20(0x6f259637dcD74C767781E37Bc6133cd6A68aa161);
    IERC20 public constant wMANA = IERC20(0xFd09Cf7cFffa9932e33668311C4777Cb9db3c9Be);
    IERC20 public constant USDD = IERC20(0x0C10bF8FcB7Bf5412187A595ab97a3609160b5c6);
    IERC20 public constant KCS = IERC20(0xf34960d9d60be18cC1D5Afc1A6F012A723a28811);
    IERC20 public constant BTT = IERC20(0xC669928185DbCE49d2230CC9B0979BE6DC797957);
    IERC20 public constant CHZ = IERC20(0x3506424F91fD33084466F402d5D97f05F8e3b4AF);
    IERC20 public constant FTM = IERC20(0x4E15361FD6b4BB609Fa63C81A2be19d873717870);
    IERC20 public constant GUSD = IERC20(0x056Fd409E1d7A124BD7017459dFEa2F387b6d5Cd);
    IERC20 public constant MKR = IERC20(0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2);
    IERC20 public constant cUSDC = IERC20(0x39AA39c021dfbaE8faC545936693aC917d5E7563);
    IERC20 public constant GRT = IERC20(0xc944E90C64B2c07662A292be6244BDf05Cda44a7);
    IERC20 public constant PAXG = IERC20(0x45804880De22913dAFE09f4980848ECE6EcbAf78);
    IERC20 public constant BIT = IERC20(0x1A4b46696b2bB4794Eb3D4c26f1c55F9170fa4C5);
    IERC20 public constant XAUt = IERC20(0x68749665FF8D2d112Fa859AA293F07A622782F38);
    IERC20 public constant cDAI = IERC20(0x5d3a536E4D6DbD6114cc1Ead35777bAB948E3643);
    IERC20 public constant SNX = IERC20(0xC011a73ee8576Fb46F5E1c5751cA3B9Fe0af2a6F);
    IERC20 public constant FXS = IERC20(0x3432B6A60D23Ca0dFCa7761B7ab56459D9C964D0);
    IERC20 public constant NEXO = IERC20(0xB62132e35a6c13ee1EE0f84dC5d40bad8d815206);
    IERC20 public constant cETH = IERC20(0x4Ddc2D193948926D02f9B1fE9e1daa0718270ED5);
    IERC20 public constant ZIL = IERC20(0x05f4a42e251f2d52b8ed15E9FEdAacFcEF1FAD27);
    IERC20 public constant XDCE = IERC20(0x41AB1b6fcbB2fA9DCEd81aCbdeC13Ea6315F2Bf2);
    IERC20 public constant ONEINCH = IERC20(0x111111111117dC0aa78b770fA6A738034120C302);
    IERC20 public constant steCRV = IERC20(0x06325440D014e39736583c165C2963BA99fAf14E);
}

library BinanceTokens {
    IUniswapV2Router public constant UNISWAP_V2_ROUTER = IUniswapV2Router(0x10ED43C718714eb63d5aA57B78B54704E256024E);
    IUniswapV2Factory public constant UNISWAP_V2_FACTORY = IUniswapV2Factory(0xcA143Ce32Fe78f1f7019d7d551a6402fC5350c73);

    // Top 50 tokens by market cap on bscscan
    IERC20 public constant ETH = IERC20(0x2170Ed0880ac9A755fd29B2688956BD959F933F8);
    IERC20 public constant BSCUSD = IERC20(0x55d398326f99059fF775485246999027B3197955);
    IERC20 public constant WBNB = IERC20(0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c);
    IERC20 public constant USDC = IERC20(0x8AC76a51cc950d9822D68b83fE1Ad97B32Cd580d);
    IERC20 public constant anyUSDC = IERC20(0x8965349fb649A33a30cbFDa057D8eC2C48AbE2A2);
    IERC20 public constant XRP = IERC20(0x1D2F0da169ceB9fC7B3144628dB156f3F6c60dBE);
    IERC20 public constant BUSD = IERC20(0xe9e7CEA3DedcA5984780Bafc599bD69ADd087D56);
    IERC20 public constant ADA = IERC20(0x3EE2200Efb3400fAbB9AacF31297cBdD1d435D47);
    IERC20 public constant DOGE = IERC20(0xbA2aE424d960c26247Dd6c32edC70B295c744C43);
    IERC20 public constant MATIC = IERC20(0xCC42724C6683B7E57334c4E856f4c9965ED682bD);
    IERC20 public constant LTC = IERC20(0x4338665CBB7B2485A8855A139b75D5e34AB0DB94);
    IERC20 public constant DAI = IERC20(0x1AF3F329e8BE154074D8769D1FFa4eE058B1DBc3);
    IERC20 public constant DOT = IERC20(0x7083609fCE4d1d8Dc0C979AAb8c869Ea2C873402);
    IERC20 public constant SHIB = IERC20(0x2859e4544C4bB03966803b044A93563Bd2D0DD4D);
    IERC20 public constant UNI = IERC20(0xBf5140A22578168FD562DCcF235E5D43A02ce9B1);
    IERC20 public constant AVAX = IERC20(0x1CE0c2827e2eF14D5C4f29a091d735A204794041);
    IERC20 public constant ATOM = IERC20(0x0Eb3a705fc54725037CC9e008bDede697f62F335);
    IERC20 public constant LINK = IERC20(0xF8A0BF9cF54Bb92F17374d9e9A321E6a111a51bD);
    IERC20 public constant ETC = IERC20(0x3d6545b08693daE087E957cb1180ee38B9e3c25E);
    IERC20 public constant BTTp = IERC20(0x8595F9dA7b868b1822194fAEd312235E43007b49);
    IERC20 public constant BCH = IERC20(0x8fF795a6F4D97E7887C79beA79aba5cc76444aDf);
    IERC20 public constant NEAR = IERC20(0x1Fa4a73a3F0133f0025378af00236f3aBDEE5D63);
    IERC20 public constant FRAX = IERC20(0x90C97F71E18723b0Cf0dfa30ee176Ab653E89F40);
    IERC20 public constant EOS = IERC20(0x56b6fB708fC5732DEC1Afc8D8556423A2EDcCbD6);
    IERC20 public constant PAX = IERC20(0xb7F8Cd00C5A06c0537E2aBfF0b58033d02e5E094);
    IERC20 public constant BTCB = IERC20(0x7130d2A12B9BCbFAe4f2634d864A1Ee1Ce3Ead9c);
    IERC20 public constant TUSD = IERC20(0x14016E85a25aeb13065688cAFB43044C2ef86784);
    IERC20 public constant AXS = IERC20(0x715D400F88C167884bbCc41C5FeA407ed4D2f8A0);
    IERC20 public constant EGLD = IERC20(0xbF7c81FFF98BbE61B40Ed186e4AfD6DDd01337fe);
    IERC20 public constant USDP = IERC20(0xb3c11196A4f3b1da7c23d9FB0A3dDE9c6340934F);
    IERC20 public constant FLOW = IERC20(0xC943c5320B9c18C153d1e2d12cC3074bebfb31A2);
    IERC20 public constant XTZ = IERC20(0x16939ef78684453bfDFb47825F8a5F714f12623a);
    IERC20 public constant USDD = IERC20(0xd17479997F34dd9156Deef8F95A52D81D265be9c);
    IERC20 public constant ZEC = IERC20(0x1Ba42e5193dfA8B03D15dd1B86a3113bbBEF8Eeb);
    IERC20 public constant SNX = IERC20(0x9Ac983826058b8a9C7Aa1C9171441191232E8404);
    IERC20 public constant TWT = IERC20(0x4B0F1812e5Df2A09796481Ff14017e6005508003);
    IERC20 public constant BTT = IERC20(0x352Cb5E19b12FC216548a2677bD0fce83BaE434B);
    IERC20 public constant MKR = IERC20(0x5f0Da599BB2ccCfcf6Fdfd7D81743B6020864350);
    IERC20 public constant FTM = IERC20(0xAD29AbB318791D579433D831ed122aFeAf29dcfe);
    IERC20 public constant IOTA = IERC20(0xd944f1D1e9d5f9Bb90b62f9D45e447D989580782);
    IERC20 public constant PAXG = IERC20(0x7950865a9140cB519342433146Ed5b40c6F210f7);
    IERC20 public constant XEC = IERC20(0x0Ef2e7602adD1733Bfdb17aC3094d0421B502cA3);
    IERC20 public constant FXS = IERC20(0xe48A3d7d0Bc88d552f730B62c006bC925eadB9eE);
    IERC20 public constant ZIL = IERC20(0xb86AbCb37C3A4B64f74f59301AFF131a1BEcC787);
    IERC20 public constant ETHW = IERC20(0x302cD8973bE5CA2334B4ff7e7b01BA41455559b3);
    IERC20 public constant ONEINCH = IERC20(0x111111111117dC0aa78b770fA6A738034120C302);
    IERC20 public constant GALA = IERC20(0x7dDEE176F665cD201F93eEDE625770E2fD911990);
    IERC20 public constant BAT = IERC20(0x101d82428437127bF1608F699CD651e6Abf9766E);
    IERC20 public constant XCN = IERC20(0x7324c7C0d95CEBC73eEa7E85CbAac0dBdf88a05b);
    IERC20 public constant COMP = IERC20(0x52CE071Bd9b1C4B00A0b92D298c512478CaD67e8);
}

library PolygonTokens {
    IERC20 public constant NATIVE_ASSET = IERC20(address(0x0));
    // Top 50 tokens by market cap on polygonscan
    IERC20 public constant USDT = IERC20(0xc2132D05D31c914a87C6611C10748AEb04B58e8F);
    IERC20 public constant BNB = IERC20(0x3BA4c387f786bFEE076A58914F5Bd38d668B42c3);
    IERC20 public constant USDC = IERC20(0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174);
    IERC20 public constant BUSD = IERC20(0xdAb529f40E671A1D4bF91361c21bf9f0C9712ab7);
    IERC20 public constant MATIC = IERC20(0x0000000000000000000000000000000000001010);
    IERC20 public constant DAI = IERC20(0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063);
    IERC20 public constant UNI = IERC20(0xb33EaAd8d922B1083446DC23f610c2567fB5180f);
    IERC20 public constant AVAX = IERC20(0x2C89bbc92BD86F8075d1DEcc58C7F4E0107f286b);
    IERC20 public constant LEO = IERC20(0x06D02e9D62A13fC76BB229373FB3BBBD1101D2fC);
    IERC20 public constant WBTC = IERC20(0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6);
    IERC20 public constant LINK = IERC20(0xb0897686c545045aFc77CF20eC7A532E3120E0F1);
    IERC20 public constant LINKb = IERC20(0x53E0bca35eC356BD5ddDFebbD1Fc0fD03FaBad39);
    IERC20 public constant APE = IERC20(0xB7b31a6BC18e48888545CE79e83E06003bE70930);
    IERC20 public constant CRO = IERC20(0xAdA58DF0F643D959C2A47c9D4d4c1a4deFe3F11C);
    IERC20 public constant LDO = IERC20(0xC3C7d422809852031b44ab29EEC9F1EfF2A58756);
    IERC20 public constant FRAX = IERC20(0x45c32fA6DF82ead1e2EF74d17b76547EDdFaFF89);
    IERC20 public constant AAVE = IERC20(0xD6DF932A45C0f255f85145f286eA0b292B21C90B);
    IERC20 public constant TUSD = IERC20(0x2e1AD108fF1D8C782fcBbB89AAd783aC49586756);
    IERC20 public constant PAX = IERC20(0x6F3B3286fd86d8b47EC737CEB3D0D354cc657B3e);
    IERC20 public constant SAND = IERC20(0xBbba073C31bF03b8ACf7c28EF0738DeCF3695683);
    IERC20 public constant THETA = IERC20(0xB46E0ae620EFd98516f49bb00263317096C114b2);
    IERC20 public constant HT = IERC20(0xFAD65Eb62a97fF5Ed91B23aFD039956aaCa6e93b);
    IERC20 public constant MANA = IERC20(0xA1c57f48F0Deb89f569dFbE6E2B7f46D33606fD4);
    IERC20 public constant USDD = IERC20(0xFFA4D863C96e743A2e1513824EA006B8D0353C57);
    IERC20 public constant CHZ = IERC20(0xf1938Ce12400f9a761084E7A80d37e732a4dA056);
    IERC20 public constant FTM = IERC20(0xC9c1c1c20B3658F8787CC2FD702267791f224Ce1);
    IERC20 public constant GUSD = IERC20(0xC8A94a3d3D2dabC3C1CaffFFDcA6A7543c3e3e65);
    IERC20 public constant MKR = IERC20(0x6f7C932e7684666C9fd1d44527765433e01fF61d);
    IERC20 public constant GRT = IERC20(0x5fe2B58c013d7601147DcdD68C143A77499f5531);
    IERC20 public constant PAXG = IERC20(0x553d3D295e0f695B9228246232eDF400ed3560B5);
    IERC20 public constant SNX = IERC20(0x50B728D8D964fd00C2d0AAD81718b71311feF68a);
    IERC20 public constant CRV = IERC20(0x172370d5Cd63279eFa6d502DAB29171933a610AF);
    IERC20 public constant FXS = IERC20(0x1a3acf6D19267E2d3e7f898f42803e90C9219062);
    IERC20 public constant NEXO = IERC20(0x41b3966B4FF7b427969ddf5da3627d6AEAE9a48E);
    IERC20 public constant WOO = IERC20(0x1B815d120B3eF02039Ee11dC2d33DE7aA4a8C603);
    IERC20 public constant ONEINCH = IERC20(0x9c2C5fd7b07E95EE044DDeba0E97a665F142394f);
    IERC20 public constant BAT = IERC20(0x3Cef98bb43d732E2F285eE605a8158cDE967D219);
    IERC20 public constant ENJ = IERC20(0x7eC26842F195c852Fa843bB9f6D8B583a274a157);
    IERC20 public constant LRC = IERC20(0x84e1670F61347CDaeD56dcc736FB990fBB47ddC1);
    IERC20 public constant RPL = IERC20(0x7205705771547cF79201111B4bd8aaF29467b9eC);
    IERC20 public constant HOT = IERC20(0x0C51f415cF478f8D08c246a6C6Ee180C5dC3A012);
    IERC20 public constant POLY = IERC20(0xcB059C5573646047D6d88dDdb87B745C18161d3b);
    IERC20 public constant SXP = IERC20(0x6aBB753C1893194DE4a83c6e8B4EadFc105Fd5f5);
    IERC20 public constant COMP = IERC20(0x8505b9d2254A7Ae468c0E9dd10Ccea3A837aef5c);
    IERC20 public constant GNO = IERC20(0x5FFD62D3C3eE2E81C00A7b9079FB248e7dF024A8);
    IERC20 public constant IOTX = IERC20(0xf6372cDb9c1d3674E83842e3800F2A62aC9F3C66);
    IERC20 public constant CEL = IERC20(0xD85d1e945766Fea5Eda9103F918Bd915FbCa63E6);
    IERC20 public constant BAL = IERC20(0x9a71012B13CA4d3D0Cdc72A177DF3ef03b0E76A3);
    IERC20 public constant SUSHI = IERC20(0x0b3F868E0BE5597D5DB7fEB59E1CADBb0fdDa50a);
    IERC20 public constant UST = IERC20(0x692597b009d13C4049a947CAB2239b7d6517875F);
}

library AvalancheTokens {
    IERC20 public constant NATIVE_ASSET = IERC20(address(0x0));
    // Top 50 tokens by market cap on snowtrace
    IERC20 public constant USDTe = IERC20(0xc7198437980c041c805A1EDcbA50c1Ce5db95118);
    IERC20 public constant USDt = IERC20(0x9702230A8Ea53601f5cD2dc00fDBc13d4dF4A8c7);
    IERC20 public constant USDCe = IERC20(0xA7D7079b0FEaD91F3e65f86E8915Cb59c1a4C664);
    IERC20 public constant USDC = IERC20(0xB97EF9Ef8734C71904D8002F8b6Bc66Dd9c48a6E);
    IERC20 public constant BUSDe = IERC20(0x19860CCB0A68fd4213aB9D8266F7bBf05A8dDe98);
    IERC20 public constant BUSD = IERC20(0x9C9e5fD8bbc25984B178FdCE6117Defa39d2db39);
    IERC20 public constant DAIe = IERC20(0xd586E7F844cEa2F87f50152665BCbc2C279D8d70);
    IERC20 public constant SHIBe = IERC20(0x02D980A0D7AF3fb7Cf7Df8cB35d9eDBCF355f665);
    IERC20 public constant UNIe = IERC20(0x8eBAf22B6F053dFFeaf46f4Dd9eFA95D89ba8580);
    IERC20 public constant WAVAX = IERC20(0xB31f66AA3C1e785363F0875A1B74E27b85FD66c7);
    IERC20 public constant WBTCe = IERC20(0x50b7545627a5162F82A992c33b87aDc75187B218);
    IERC20 public constant LINKe = IERC20(0x5947BB275c521040051D82396192181b413227A3);
    IERC20 public constant FRAX = IERC20(0xD24C2Ad096400B6FBcd2ad8B24E7acBc21A1da64);
    IERC20 public constant AAVEe = IERC20(0x63a72806098Bd3D9520cC43356dD78afe5D386D9);
    IERC20 public constant TUSD = IERC20(0x1C20E891Bab6b1727d14Da358FAe2984Ed9B59EB);
    IERC20 public constant USDD = IERC20(0xcf799767d366d789e8B446981C2D578E241fa25c);
    IERC20 public constant SNXe = IERC20(0xBeC243C995409E6520D7C41E404da5dEba4b209B);
    IERC20 public constant GRTe = IERC20(0x8a0cAc13c7da965a312f08ea4229c37869e85cB9);
    IERC20 public constant MKRe = IERC20(0x88128fd4b259552A9A1D457f435a6527AAb72d42);
    IERC20 public constant CRVe = IERC20(0x249848BeCA43aC405b8102Ec90Dd5F22CA513c06);
    IERC20 public constant FXS = IERC20(0x214DB107654fF987AD859F34125307783fC8e387);
    IERC20 public constant ONEINCHe = IERC20(0xd501281565bf7789224523144Fe5D98e8B28f267);
    IERC20 public constant BATe = IERC20(0x98443B96EA4b0858FDF3219Cd13e98C7A4690588);
    IERC20 public constant SUSHIe = IERC20(0x37B608519F91f70F2EeB0e5Ed9AF4061722e4F76);
    IERC20 public constant COMPe = IERC20(0xc3048E19E76CB9a3Aa9d77D8C03c29Fc906e2437);
    IERC20 public constant YFIe = IERC20(0x9eAaC1B23d935365bD7b542Fe22cEEe2922f52dc);
    IERC20 public constant ZRXe = IERC20(0x596fA47043f99A4e0F122243B841E55375cdE0d2);
    IERC20 public constant UMAe = IERC20(0x3Bd2B1c7ED8D396dbb98DED3aEbb41350a5b2339);
    IERC20 public constant ANY = IERC20(0xB44a9B6905aF7c801311e8F4E76932ee959c663C);
    IERC20 public constant KNC = IERC20(0x39fC9e94Caeacb435842FADeDeCB783589F50f5f);
    IERC20 public constant BTCb = IERC20(0x152b9d0FdC40C096757F570A51E494bd4b943E50);
    IERC20 public constant ORBS = IERC20(0x340fE1D898ECCAad394e2ba0fC1F93d27c7b717A);
    IERC20 public constant SYN = IERC20(0x1f1E7c893855525b303f99bDF5c3c05Be09ca251);
    IERC20 public constant SPELL = IERC20(0xCE1bFFBD5374Dac86a2893119683F4911a2F7814);
    IERC20 public constant ALPHAe = IERC20(0x2147EFFF675e4A4eE1C2f918d181cDBd7a8E208f);
    IERC20 public constant BOBA = IERC20(0x3cD790449CF7D187a143d4Bd7F4654d4f2403e02);
    IERC20 public constant SURE = IERC20(0x5fC17416925789E0852FBFcd81c490ca4abc51F9);
    IERC20 public constant STG = IERC20(0x2F6F07CDcf3588944Bf4C42aC74ff24bF56e7590);
    IERC20 public constant xJOE = IERC20(0x57319d41F71E81F3c65F2a47CA4e001EbAFd4F33);
    IERC20 public constant JOE = IERC20(0x6e84a6216eA6dACC71eE8E6b0a5B7322EEbC0fDd);
    IERC20 public constant BIFI = IERC20(0xd6070ae98b8069de6B494332d1A1a81B6179D960);
    IERC20 public constant ETHM = IERC20(0x55b1a124c04A54eeFDEFE5FA2Ef5f852FB5f2f26);
    IERC20 public constant QI = IERC20(0x8729438EB15e2C8B576fCc6AeCdA6A148776C0F5);
    IERC20 public constant SWAPe = IERC20(0xc7B5D72C836e718cDA8888eaf03707fAef675079);
    IERC20 public constant UNCX = IERC20(0x3b9e3b5c616A1A038fDc190758Bbe9BAB6C7A857);
    IERC20 public constant WALBT = IERC20(0x9E037dE681CaFA6E661e6108eD9c2bd1AA567Ecd);
    IERC20 public constant JADE = IERC20(0x80B010450fDAf6a3f8dF033Ee296E92751D603B3);
    IERC20 public constant sJADE = IERC20(0x3D9eAB723df76808bB84c05b20De27A2e69EF293);
    IERC20 public constant RISE = IERC20(0xC17c30e98541188614dF99239cABD40280810cA3);
    IERC20 public constant PENDLE = IERC20(0xfB98B335551a418cD0737375a2ea0ded62Ea213b);
}

library FantomTokens {
    IERC20 public constant NATIVE_ASSET = IERC20(address(0x0));
    // Top 50 tokens by market cap on ftmscan
    IERC20 public constant FBTC = IERC20(0xe1146b9AC456fCbB60644c36Fd3F868A9072fc6E);
    IERC20 public constant FETH = IERC20(0x658b0c7613e890EE50B8C4BC6A3f41ef411208aD);
    IERC20 public constant USDC = IERC20(0x04068DA6C83AFCFA0e13ba15A6696662335D5B75);
    IERC20 public constant DAI = IERC20(0x8D11eC38a3EB5E956B052f67Da8Bdc9bef8Abf3E);
    IERC20 public constant AVAX = IERC20(0x511D35c52a3C244E7b8bd92c0C297755FbD89212);
    IERC20 public constant BTC = IERC20(0x321162Cd933E2Be498Cd2267a90534A804051b11);
    IERC20 public constant LINK = IERC20(0xb3654dc3D10Ea7645f8319668E8F54d2574FBdC8);
    IERC20 public constant FRAX = IERC20(0xdc301622e621166BD8E82f2cA0A26c13Ad0BE355);
    IERC20 public constant AAVE = IERC20(0x6a07A792ab2965C72a5B8088d3a069A7aC3a993B);
    IERC20 public constant TUSD = IERC20(0x9879aBDea01a879644185341F7aF7d8343556B7a);
    IERC20 public constant USDD = IERC20(0xcf799767d366d789e8B446981C2D578E241fa25c);
    IERC20 public constant SFTM = IERC20(0x69c744D3444202d35a2783929a0F930f2FBB05ad);
    IERC20 public constant WFTM = IERC20(0x21be370D5312f44cB42ce377BC9b8a0cEF1A4C83);
    IERC20 public constant SNX = IERC20(0x56ee926bD8c72B2d5fa1aF4d9E4Cbb515a1E3Adc);
    IERC20 public constant CRV = IERC20(0x1E4F97b9f9F913c46F1632781732927B9019C68b);
    IERC20 public constant FXS = IERC20(0x7d016eec9c25232b01F23EF992D98ca97fc2AF5a);
    IERC20 public constant CEL = IERC20(0x2C78f1b70Ccf63CDEe49F9233e9fAa99D43AA07e);
    IERC20 public constant SUSHI = IERC20(0xae75A438b2E0cB8Bb01Ec1E1e376De11D44477CC);
    IERC20 public constant BAND = IERC20(0x46E7628E8b4350b2716ab470eE0bA1fa9e76c6C5);
    IERC20 public constant FBAND = IERC20(0x078EEF5A2fb533e1a4d487ef64b27DF113d12C32);
    IERC20 public constant YFI = IERC20(0x29b0Da86e484E1C0029B56e817912d778aC0EC69);
    IERC20 public constant SYN = IERC20(0xE55e19Fb4F2D85af758950957714292DAC1e25B2);
    IERC20 public constant MIM = IERC20(0x82f0B8B456c1A451378467398982d4834b6829c1);
    IERC20 public constant ORBS = IERC20(0x3E01B7E242D5AF8064cB9A8F9468aC0f8683617c);
    IERC20 public constant SPELL = IERC20(0x468003B688943977e6130F4F68F23aad939a1040);
    IERC20 public constant ALPHA = IERC20(0x11eb3aA66FE1f2B75cB353D3e874E96968182BdA);
    IERC20 public constant BOBA = IERC20(0x4389b230D15119c347B9E8BEA6d930A21aaDF6BA);
    IERC20 public constant STG = IERC20(0x2F6F07CDcf3588944Bf4C42aC74ff24bF56e7590);
    IERC20 public constant ALPACA = IERC20(0xaD996A45fd2373ed0B10Efa4A8eCB9de445A4302);
    IERC20 public constant KP3R = IERC20(0x2A5062D22adCFaAfbd5C541d4dA82E4B450d4212);
    IERC20 public constant ORN = IERC20(0xD2cDcB6BdEE6f78DE7988a6A60d13F6eF0b576D9);
    IERC20 public constant HEGIC = IERC20(0x44B26E839eB3572c5E959F994804A5De66600349);
    IERC20 public constant DOLA = IERC20(0x3129662808bEC728a27Ab6a6b9AFd3cBacA8A43c);
    IERC20 public constant TOR = IERC20(0x74E23dF9110Aa9eA0b6ff2fAEE01e740CA1c642e);
    IERC20 public constant BOO = IERC20(0x841FAD6EAe12c286d1Fd18d1d525DFfA75C7EFFE);
    IERC20 public constant RISE = IERC20(0xC17c30e98541188614dF99239cABD40280810cA3);
    IERC20 public constant RAI = IERC20(0xa71353Bb71DdA105D383B02fc2dD172C4D39eF8B);
    IERC20 public constant HOGE = IERC20(0xF31778D591c558140398F46feCA42A6a2dbFFe90);
    IERC20 public constant GEL = IERC20(0x15b7c0c907e4C6b9AdaAaabC300C08991D6CEA05);
    IERC20 public constant GEIST = IERC20(0xd8321AA83Fb0a4ECd6348D4577431310A6E0814d);
    IERC20 public constant wBAN = IERC20(0xe20B9e246db5a0d21BF9209E4858Bc9A3ff7A034);
    IERC20 public constant HEC = IERC20(0x5C4FDfc5233f935f20D2aDbA572F770c2E377Ab0);
    IERC20 public constant sHEC = IERC20(0x75bdeF24285013387A47775828bEC90b91Ca9a5F);
    IERC20 public constant TOMB = IERC20(0x6c021Ae822BEa943b2E66552bDe1D2696a53fbB7);
    IERC20 public constant fmXEN = IERC20(0xeF4B763385838FfFc708000f884026B8c0434275);
    IERC20 public constant TREEB = IERC20(0xc60D7067dfBc6f2caf30523a064f416A5Af52963);
    IERC20 public constant BEETS = IERC20(0xF24Bcf4d1e507740041C9cFd2DddB29585aDCe1e);
    IERC20 public constant WIGO = IERC20(0xE992bEAb6659BFF447893641A378FbbF031C5bD6);
    IERC20 public constant TETU = IERC20(0x65c9d9d080714cDa7b5d58989Dc27f897F165179);
    IERC20 public constant TSHARE = IERC20(0x4cdF39285D7Ca8eB3f090fDA0C069ba5F4145B37);
}

library OptimismTokens {
    IERC20 public constant NATIVE_ASSET = IERC20(address(0x0));
    // Top 29 tokens by market cap on optimistic.etherscan
    IERC20 public constant USDT = IERC20(0x94b008aA00579c1307B0EF2c499aD98a8ce58e58);
    IERC20 public constant USDC = IERC20(0x7F5c764cBc14f9669B88837ca1490cCa17c31607);
    IERC20 public constant DAI = IERC20(0xDA10009cBd5D07dd0CeCc66161FC93D7c9000da1);
    IERC20 public constant WBTC = IERC20(0x68f180fcCe6836688e9084f035309E29Bf0A2095);
    IERC20 public constant LINK = IERC20(0x350a791Bfc2C21F9Ed5d10980Dad2e2638ffa7f6);
    IERC20 public constant LDO = IERC20(0xFdb794692724153d1488CcdBE0C56c252596735F);
    IERC20 public constant FRAX = IERC20(0x2E3D870790dC77A83DD1d18184Acc7439A53f475);
    IERC20 public constant USDD = IERC20(0xC22885e06cd8507c5c74a948C59af853AEd1Ea5C);
    IERC20 public constant SNX = IERC20(0x8700dAec35aF8Ff88c16BdF0418774CB3D7599B4);
    IERC20 public constant FXS = IERC20(0x67CCEA5bb16181E7b4109c9c2143c24a1c2205Be);
    IERC20 public constant OP = IERC20(0x4200000000000000000000000000000000000042);
    IERC20 public constant UST = IERC20(0xFB21B70922B9f6e3C6274BcD6CB1aa8A0fe20B80);
    IERC20 public constant KNC = IERC20(0xa00E3A3511aAC35cA78530c85007AFCd31753819);
    IERC20 public constant sUSD = IERC20(0x8c6f28f2F1A3C87F0f938b96d27520d9751ec8d9);
    IERC20 public constant BIFI = IERC20(0x4E720DD3Ac5CFe1e1fbDE4935f386Bb1C66F4642);
    IERC20 public constant sETH = IERC20(0xE405de8F52ba7559f9df3C368500B6E6ae6Cee49);
    IERC20 public constant BOB = IERC20(0xB0B195aEFA3650A6908f15CdaC7D92F8a5791B0B);
    IERC20 public constant THALES = IERC20(0x217D47011b23BB961eB6D93cA9945B7501a5BB11);
    IERC20 public constant USDPLUS = IERC20(0x73cb180bf0521828d8849bc8CF2B920918e23032);
    IERC20 public constant sBTC = IERC20(0x298B9B95708152ff6968aafd889c6586e9169f1D);
    IERC20 public constant RGT = IERC20(0xB548f63D4405466B36C0c0aC3318a22fDcec711a);
    IERC20 public constant HOP = IERC20(0xc5102fE9359FD9a28f877a67E36B0F050d81a3CC);
    IERC20 public constant O3 = IERC20(0xEe9801669C6138E84bD50dEB500827b776777d28);
    IERC20 public constant DCN = IERC20(0x1da650C3B2DaA8AA9Ff6F661d4156Ce24d08A062);
    IERC20 public constant sLINK = IERC20(0xc5Db22719A06418028A40A9B5E9A7c02959D0d08);
    IERC20 public constant PICKLE = IERC20(0x0c5b4c92c948691EEBf185C17eeB9c230DC019E9);
    IERC20 public constant ROOBEE = IERC20(0xb12c13e66AdE1F72f71834f2FC5082Db8C091358);
    IERC20 public constant GRG = IERC20(0xEcF46257ed31c329F204Eb43E254C609dee143B3);
    IERC20 public constant IB = IERC20(0x00a35FD824c717879BF370E70AC6868b95870Dfb);
}

library GnosisTokens {
    IERC20 public constant NATIVE_ASSET = IERC20(address(0x0));
    // Top 50 tokens by market cap on gnosisscan.io
    IERC20 public constant USDT = IERC20(0x4ECaBa5870353805a9F068101A40E0f32ed605C6);
    IERC20 public constant USDC = IERC20(0xDDAfbb505ad214D7b80b1f830fcCc89B60fb7A83);
    IERC20 public constant MATIC = IERC20(0x7122d7661c4564b7C6Cd4878B06766489a6028A2);
    IERC20 public constant UNI = IERC20(0x4537e328Bf7e4eFA29D05CAeA260D7fE26af9D74);
    IERC20 public constant LINK = IERC20(0xE2e73A1c69ecF83F464EFCE6A5be353a37cA09b2);
    IERC20 public constant RPL = IERC20(0x2F0E755Efe6b58238A67DB420Ff3513Ec1fb31eF);
    IERC20 public constant YFI = IERC20(0xbf65bfcb5da067446CeE6A706ba3Fe2fB1a9fdFd);
    IERC20 public constant GNO = IERC20(0x9C58BAcC331c9aa871AFD802DB6379a98e80CEdb);
    IERC20 public constant EWTB = IERC20(0x6A8cb6714B1EE5b471a7D2eC4302cb4f5Ff25eC2);
    IERC20 public constant BADGER = IERC20(0xdfc20AE04ED70bd9c7D720F449eEDAe19F659D65);
    IERC20 public constant DATA = IERC20(0x256eb8a51f382650B2A1e946b8811953640ee47D);
    IERC20 public constant DPI = IERC20(0xD3D47d5578e55C880505dC40648F7F9307C3e7A8);
    IERC20 public constant HOPR = IERC20(0xD057604A14982FE8D88c5fC25Aac3267eA142a08);
    IERC20 public constant FOX = IERC20(0x21a42669643f45Bc0e086b8Fc2ed70c23D67509d);
    IERC20 public constant xMOON = IERC20(0x1e16aa4Df73d29C029d94CeDa3e3114EC191E25A);
    IERC20 public constant DXD = IERC20(0xb90D6bec20993Be5d72A5ab353343f7a0281f158);
    IERC20 public constant UNCX = IERC20(0x0116e28B43A358162B96f70B4De14C98A4465f25);
    IERC20 public constant SWASH = IERC20(0x84E2C67CBEfae6B5148fcA7d02B341B12ff4b5Bb);
    IERC20 public constant COW = IERC20(0x177127622c4A00F3d409B75571e12cB3c8973d3c);
    IERC20 public constant HOP = IERC20(0xc5102fE9359FD9a28f877a67E36B0F050d81a3CC);
    IERC20 public constant DIP = IERC20(0x48b1B0d077b4919b65b4E4114806dD803901E1D9);
    IERC20 public constant MPS = IERC20(0xfa57AA7beED63D03Aaf85fFd1753f5f6242588fb);
    IERC20 public constant HAUS = IERC20(0xb0C5f3100A4d9d9532a4CfD68c55F1AE8da987Eb);
    IERC20 public constant GIV = IERC20(0x4f4F9b8D5B4d0Dc10506e5551B0513B61fD59e75);
    IERC20 public constant ETHIX = IERC20(0xec3f3e6d7907acDa3A7431abD230196CDA3FbB19);
    IERC20 public constant STAKE = IERC20(0xb7D311E2Eb55F2f68a9440da38e7989210b9A05e);
    IERC20 public constant GTON = IERC20(0x6aB6d61428fde76768D7b45D8BFeec19c6eF91A8);
    IERC20 public constant SWPR = IERC20(0x532801ED6f82FFfD2DAB70A19fC2d7B2772C4f4b);
    IERC20 public constant AGVE = IERC20(0x3a97704a1b25F08aa230ae53B352e2e72ef52843);
    IERC20 public constant ETHO = IERC20(0xB17d999E840e0c1B157Ca5Ab8039Bd958b5fA317);
    IERC20 public constant DHV = IERC20(0xFbdd194376de19a88118e84E279b977f165d01b8);
    IERC20 public constant ZeroxMR = IERC20(0x8c88eA1fD60462Ef7004B9e288afCB4680a3c50c);
    IERC20 public constant DONUT = IERC20(0x524B969793a64a602342d89BC2789D43a016B13A);
    IERC20 public constant MIVA = IERC20(0x63e62989D9EB2d37dfDB1F93A22f063635b07d51);
    IERC20 public constant NODE = IERC20(0xc60e38C6352875c051B481Cbe79Dd0383AdB7817);
    IERC20 public constant LEVIN = IERC20(0x1698cD22278ef6E7c0DF45a8dEA72EDbeA9E42aa);
    IERC20 public constant WETH = IERC20(0x6A023CCd1ff6F2045C3309768eAd9E68F978f6e1);
    IERC20 public constant HNY = IERC20(0x71850b7E9Ee3f13Ab46d67167341E4bDc905Eef9);
    IERC20 public constant jCHF = IERC20(0x2d5563da42b06FbBF9c67b7DC073cF6A7842239e);
    IERC20 public constant jEUR = IERC20(0x9fB1d52596c44603198fB0aee434fac3a679f702);
    IERC20 public constant WXDAI = IERC20(0xe91D153E0b41518A2Ce8Dd3D7944Fa863463a97d);
    IERC20 public constant TEC = IERC20(0x5dF8339c5E282ee48c0c7cE8A7d01a73D38B3B27);
    IERC20 public constant RICE = IERC20(0x97Edc0e345FbBBd8460847Fcfa3bc2a13bF8641F);
    IERC20 public constant WATER = IERC20(0x4291F029B9e7acb02D49428458cf6fceAC545f81);
    IERC20 public constant SYMM = IERC20(0xC45b3C1c24d5F54E7a2cF288ac668c74Dd507a84);
    IERC20 public constant BRIGHT = IERC20(0x83FF60E2f93F8eDD0637Ef669C69D5Fb4f64cA8E);
    IERC20 public constant xCOMB = IERC20(0x38Fb649Ad3d6BA1113Be5F57B927053E97fC5bF7);
    IERC20 public constant JPYC = IERC20(0x431D5dfF03120AFA4bDf332c61A6e1766eF37BDB);
    IERC20 public constant ESR = IERC20(0xD3226B12e6188133b19Ac0419f34B0ed5B10f069);
    IERC20 public constant RAID = IERC20(0x18E9262e68Cc6c6004dB93105cc7c001BB103e49);
}
// Weired ERC20
// {'addr': '0xae616e72d3d89e847f74e8ace41ca68bbf56af79', 'name': 'GOOD', 'decimals': 6}
// {'addr': '0x93e682107d1e9defb0b5ee701c71707a4b2e46bc', 'name': 'MCAP', 'decimals': 8}
// {'addr': '0xb97048628db6b661d4c2aa833e95dbe1a905b280', 'name': 'PAY', 'decimals': 18}
// {'addr': '0x4470bb87d77b963a013db939be332f927f2b992e', 'name': 'ADX', 'decimals': 4}
// {'addr': '0xd26114cd6ee289accf82350c8d8487fedb8a0c07', 'name': 'OMG', 'decimals': 18}
// {'addr': '0xb8c77482e45f1f44de1745f52c74426c631bdd52', 'name': 'BNB', 'decimals': 18}
// {'addr': '0xf433089366899d83a9f26a773d59ec7ecf30355e', 'name': 'MTL', 'decimals': 8}
// {'addr': '0xc63e7b1dece63a77ed7e4aeef5efb3b05c81438d', 'name': 'FUCKOLD', 'decimals': 4}
// {'addr': '0xab16e0d25c06cb376259cc18c1de4aca57605589', 'name': 'FUCK', 'decimals': 4}
// {'addr': '0xe3818504c1b32bf1557b16c238b2e01fd3149c17', 'name': 'PLR', 'decimals': 18}
// {'addr': '0xe2e6d4be086c6938b53b22144855eef674281639', 'name': 'LNK', 'decimals': 18}
// {'addr': '0x2bdc0d42996017fce214b21607a515da41a9e0c5', 'name': 'SKIN', 'decimals': 6}
// {'addr': '0xea1f346faf023f974eb5adaf088bbcdf02d761f4', 'name': 'TIX', 'decimals': 18}
// {'addr': '0x177d39ac676ed1c67a2b268ad7f1e58826e5b0af', 'name': 'CDT', 'decimals': 18}
// {'addr': '0x56ba2ee7890461f463f7be02aac3099f6d5811a8', 'name': 'CAT', 'decimals': 18}
// {'addr': '0x08fd34559f2ed8585d3810b4d96ab8a05c9f97c5', 'name': 'CLRT', 'decimals': 18}
// {'addr': '0x2a05d22db079bc40c2f77a1d1ff703a56e631cc1', 'name': 'BAS', 'decimals': 8}
// {'addr': '0xdc0c22285b61405aae01cba2530b6dd5cd328da7', 'name': 'KTN', 'decimals': 6}
// {'addr': '0x9e77d5a1251b6f7d456722a6eac6d2d5980bd891', 'name': 'BRAT', 'decimals': 8}
// {'addr': '0x202e295df742befa5e94e9123149360db9d9f2dc', 'name': 'NIH', 'decimals': 8}
// {'addr': '0xfb12e3cca983b9f59d90912fd17f8d745a8b2953', 'name': 'LUCK', 'decimals': 0}
// {'addr': '0x94298f1e0ab2dfad6eeffb1426846a3c29d98090', 'name': 'MyB', 'decimals': 8}
// {'addr': '0x4355fc160f74328f9b383df2ec589bb3dfd82ba0', 'name': 'OPT', 'decimals': 18}
// {'addr': '0x17fd666fa0784885fa1afec8ac624d9b7e72b752', 'name': 'FLIK', 'decimals': 14}
// {'addr': '0x422866a8f0b032c5cf1dfbdef31a20f4509562b0', 'name': 'ADST', 'decimals': 0}
// {'addr': '0xef68e7c694f40c8202821edf525de3782458639f', 'name': 'LRC', 'decimals': 18}
// {'addr': '0xe6923e9b56db1eed1c9f430ea761da7565e260fe', 'name': 'FC', 'decimals': 2}
// {'addr': '0xf05a9382a4c3f29e2784502754293d88b835109c', 'name': 'REX', 'decimals': 18}
// {'addr': '0x73dd069c299a5d691e9836243bcaec9c8c1d8734', 'name': 'BTE', 'decimals': 8}
// {'addr': '0x5cf4e9dfd975c52aa523fb5945a12235624923dc', 'name': 'MPRM', 'decimals': 0}
// {'addr': '0x336f646f87d9f6bc6ed42dd46e8b3fd9dbd15c22', 'name': 'CCT', 'decimals': 18}
// {'addr': '0x190e569be071f40c704e15825f285481cb74b6cc', 'name': 'FAM', 'decimals': 12}
// {'addr': '0x190fb342aa6a15eb82903323ae78066ff8616746', 'name': 'UMC', 'decimals': 6}
// {'addr': '0xa6e7172662379f1f4c72108655869abdbb7f7672', 'name': 'JADE', 'decimals': 5}
// {'addr': '0xc997d07b0bc607b6d1bcb6fb9d4a5579c466c3e5', 'name': 'FLIP', 'decimals': 0}
// {'addr': '0xab6cf87a50f17d7f5e1feaf81b6fe9ffbe8ebf84', 'name': 'MRV', 'decimals': 18}
// {'addr': '0xac3da587eac229c9896d919abc235ca4fd7f72c1', 'name': 'TGT', 'decimals': 1}
// {'addr': '0x437cf0bf53634e3dfa5e3eaff3104004d50fb532', 'name': 'BTN', 'decimals': 4}
// {'addr': '0x8727c112c712c4a03371ac87a74dd6ab104af768', 'name': 'JET', 'decimals': 18}
// {'addr': '0x78b7fada55a64dd895d8c8c35779dd8b67fa8a05', 'name': 'ATL', 'decimals': 18}
// {'addr': '0x2f4baef93489b09b5e4b923795361a65a26f55e5', 'name': 'XHY', 'decimals': 8}
// {'addr': '0xe256bb0b2a3457e54db3a41cf5a8b826aca222a8', 'name': 'ARX', 'decimals': 18}
// {'addr': '0xb45a50545beeab73f38f31e5973768c421805e5e', 'name': 'TKR', 'decimals': 18}
// {'addr': '0x46eec301d2d00087145d1588282c182bd1890e5c', 'name': 'RSPR', 'decimals': 16}
// {'addr': '0x12480e24eb5bec1a9d4369cab6a80cad3c0a377a', 'name': 'SUB', 'decimals': 2}
// {'addr': '0xdcb9ff81013c31ff686154b4502ef6bfaa102d2d', 'name': 'GOOC', 'decimals': 8}
// {'addr': '0x13ea82d5e1a811f55bda9c86fdd6195a6bd23aed', 'name': 'TFT', 'decimals': 8}
// {'addr': '0xeeac3f8da16bb0485a4a11c5128b0518dac81448', 'name': 'TEU', 'decimals': 18}
// {'addr': '0x23cb17d7d079518dbff4febb6efcc0de58d8c984', 'name': 'TRV', 'decimals': 16}
// {'addr': '0x10b123fddde003243199aad03522065dc05827a0', 'name': 'SYN', 'decimals': 18}
// {'addr': '0x0aef06dcccc531e581f0440059e6ffcc206039ee', 'name': 'ITT', 'decimals': 8}
// {'addr': '0x0b76544f6c413a555f309bf76260d1e02377c02a', 'name': 'INT', 'decimals': 6}
// {'addr': '0x0766e79a6fd74469733e8330b3b461c0320ff059', 'name': 'EXN', 'decimals': 18}
// {'addr': '0x3a26746ddb79b1b8e4450e3f4ffe3285a307387e', 'name': 'ETHB', 'decimals': 8}
// {'addr': '0xe26517a9967299453d3f1b48aa005e6127e67210', 'name': 'NIMFA', 'decimals': 18}
// {'addr': '0x37f014c64d186eaf879c0033846b51924ce42584', 'name': 'MDT', 'decimals': 0}
// {'addr': '0xfd784da5c740c617aafb80399fa81b86e1da99a5', 'name': 'ITS', 'decimals': 8}
// {'addr': '0xf8fa1a588cd8cd51c3c4d6dc16d2717f6332e821', 'name': 'BXC', 'decimals': 2}
// {'addr': '0xdded69d8e28d38d640f6244ab5294f309fd40ce1', 'name': 'LMT', 'decimals': 8}
// {'addr': '0xef25e54e1ae9bfd966b9b5cde6880e7a2323a957', 'name': 'SOCIAL', 'decimals': 18}
// {'addr': '0x5f6e7fb7fe92ea7822472bb0e8f1be60d6a4ea50', 'name': 'ARTE', 'decimals': 18}
// {'addr': '0x8633e144f2d9b9b8bdd12ddb58e4bef1e163a0ce', 'name': 'YEL', 'decimals': 18}
// {'addr': '0xe2f45f1660dc99daf3bd06f637ab1e4debc15bde', 'name': 'SGG', 'decimals': 6}
// {'addr': '0xba5f11b16b155792cf3b2e6880e8706859a8aeb6', 'name': 'ARN', 'decimals': 8}
// {'addr': '0xa6e2f7f33f01fb399e72f3e044196eab7d348012', 'name': 'AMO', 'decimals': 4}
// {'addr': '0x22c10728343e9d49ef25080f74a223878a3d4052', 'name': 'DRP2', 'decimals': 8}
// {'addr': '0x8e10f6bb9c973d61321c25a2b8d865825f4aa57b', 'name': '0ED', 'decimals': 18}
// {'addr': '0xbb1b3e8ddded8165d58b0c192d19cd360682b170', 'name': 'CAS', 'decimals': 2}
// {'addr': '0xe58aff48f738b4a719d1790587cdc91a3560d7e1', 'name': 'TMP', 'decimals': 7}
// {'addr': '0x87ae38d63a6bbb63e46219f494b549e3be7fc400', 'name': 'LAP', 'decimals': 8}
// {'addr': '0x7f2176ceb16dcb648dc924eff617c3dc2befd30d', 'name': 'OHNI', 'decimals': 0}
// {'addr': '0x26d5bd2dfeda983ecd6c39899e69dae6431dffbb', 'name': 'ERC20', 'decimals': 18}
// {'addr': '0xd9a0658b7cc9ec0c57e8b20c0920d08f17e747be', 'name': 'SAT', 'decimals': 10}
// {'addr': '0x999967e2ec8a74b7c8e9db19e039d920b31d39d0', 'name': 'TIE', 'decimals': 18}
// {'addr': '0xe3fa177acecfb86721cf6f9f4206bd3bd672d7d5', 'name': 'CTT', 'decimals': 18}
// {'addr': '0xc99ddc30bb0cf76b07d90dcb6b267b8352697bef', 'name': 'TDT', 'decimals': 18}
// {'addr': '0x01c67791309c71aa4ed373025a0c089696d7c9e4', 'name': 'CCB', 'decimals': 18}
// {'addr': '0x12a35383ca24ceb44cdcbbecbeb7baccb5f3754a', 'name': 'CS', 'decimals': 6}
// {'addr': '0x6f6deb5db0c4994a8283a01d6cfeeb27fc3bbe9c', 'name': 'SMART', 'decimals': 0}
// {'addr': '0xdd007278b667f6bef52fd0a4c23604aa1f96039a', 'name': 'RIPT', 'decimals': 8}
// {'addr': '0x93e24ce396a9e7d7de4a5bc616cf5fcab0476626', 'name': 'ZIP', 'decimals': 8}
// {'addr': '0x7c53f13699e1f6ef5c699e893a20948bdd2e4de9', 'name': 'DVD', 'decimals': 18}
// {'addr': '0x3485b9566097ad656c70d6ebbd1cd044e2e72d05', 'name': 'PNKOLD', 'decimals': 0}
// {'addr': '0xea642206310400cda4c1c5b8e7945314aa96b8a7', 'name': 'MINT', 'decimals': 18}
// {'addr': '0x0b24fdf35876bbe2a1cc925321b8c301017474d4', 'name': 'JWT', 'decimals': 0}
// {'addr': '0x219218f117dc9348b358b8471c55a073e5e0da0b', 'name': 'GRX', 'decimals': 18}
// {'addr': '0x70838403ecc194b73e50b70a177b2ef413a2f421', 'name': 'BZX', 'decimals': 18}
// {'addr': '0x9e386da8cdfcf8b9e7490e3f2a4589c570cb2b2f', 'name': 'RPIL', 'decimals': 8}
// {'addr': '0x82b0e50478eeafde392d45d1259ed1071b6fda81', 'name': 'DNA', 'decimals': 18}
// {'addr': '0x1844b21593262668b7248d0f57a220caaba46ab9', 'name': 'PRL', 'decimals': 18}
// {'addr': '0x149a23f3d1a1e61e1e3b7eddd27f32e01f9788c7', 'name': 'CARE', 'decimals': 18}
// {'addr': '0x90b1b771d0814d607da104b988efa39288219d62', 'name': 'MEDI', 'decimals': 18}
// {'addr': '0xfad572db566e5234ac9fc3d570c4edc0050eaa92', 'name': 'BTHE', 'decimals': 18}
// {'addr': '0xd317ff47dc7e1423e5e050870a66332833e5fd88', 'name': 'PNY', 'decimals': 0}
// {'addr': '0xcc34366e3842ca1bd36c1f324d15257960fcc801', 'name': 'BON', 'decimals': 18}
// {'addr': '0x1d9e20e581a5468644fe74ccb6a46278ef377f9e', 'name': 'CDRT', 'decimals': 8}
// {'addr': '0x7b69b78cc7fee48202c208609ae6d1f78ce42e13', 'name': 'GOAL', 'decimals': 18}
// {'addr': '0xffb99f90bcd96fe743796fd8eefaaa6617753e79', 'name': 'MMC2', 'decimals': 0}
// {'addr': '0x5121e348e897daef1eef23959ab290e5557cf274', 'name': 'AI', 'decimals': 18}
// {'addr': '0x4632091b0dd0e0902d1fe0534e16eb7b20328d70', 'name': 'ULT', 'decimals': 18}
// {'addr': '0x0f9b1d1d39118480cf8b9575419ea4e5189c88dd', 'name': 'WET', 'decimals': 0}
// {'addr': '0x30cc0e266cf33b8eac6a99cbd98e39b890cfd69b', 'name': 'CLASSY', 'decimals': 16}
// {'addr': '0x9d5b592b687c887a5a34df5f9207adb2c2db3aec', 'name': 'ETBT', 'decimals': 18}
// {'addr': '0x0f513ffb4926ff82d7f60a05069047aca295c413', 'name': 'XSC', 'decimals': 18}
// {'addr': '0x0bb217e40f8a5cb79adf04e1aab60e5abd0dfc1e', 'name': 'SWFTC', 'decimals': 8}
// {'addr': '0x679badc551626e01b23ceecefbc9b877ea18fc46', 'name': 'CCO', 'decimals': 18}
// {'addr': '0x8ce9411df545d6b51a9bc52a89e0f6d1b54a06dd', 'name': 'ABS', 'decimals': 0}
// {'addr': '0xa0e743c37c470ab381cf0e87b6e8f12ef19586fd', 'name': 'CRYPHER', 'decimals': 18}
// {'addr': '0x21692a811335301907ecd6343743791802ba7cfd', 'name': 'ADU', 'decimals': 18}
// {'addr': '0xe42ba5558b00d2e6109cc60412d5d4c9473fe998', 'name': 'IMC', 'decimals': 18}
// {'addr': '0x2eb86e8fc520e0f6bb5d9af08f924fe70558ab89', 'name': 'LGR', 'decimals': 8}
// {'addr': '0xe25bcec5d3801ce3a794079bf94adf1b8ccd802d', 'name': 'MAN', 'decimals': 18}
// {'addr': '0x2d0e95bd4795d7ace0da3c0ff7b706a5970eb9d3', 'name': 'SOC', 'decimals': 18}
// {'addr': '0xa33e729bf4fdeb868b534e1f20523463d9c46bee', 'name': '¢', 'decimals': 10}
// {'addr': '0x38c6a68304cdefb9bec48bbfaaba5c5b47818bb2', 'name': 'HPB', 'decimals': 18}
// {'addr': '0x81c9151de0c8bafcd325a57e3db5a5df1cebf79c', 'name': 'DAT', 'decimals': 18}
// {'addr': '0x8542325b72c6d9fc0ad2ca965a78435413a915a0', 'name': 'SHL', 'decimals': 18}
// {'addr': '0x2f85e502a988af76f7ee6d83b7db8d6c0a823bf9', 'name': 'LATX', 'decimals': 8}
// {'addr': '0x6ba460ab75cd2c56343b3517ffeba60748654d26', 'name': 'UP', 'decimals': 8}
// {'addr': '0xfae4ee59cdd86e3be9e8b90b53aa866327d7c090', 'name': 'CPC', 'decimals': 18}
// {'addr': '0x7703c35cffdc5cda8d27aa3df2f9ba6964544b6e', 'name': 'PYLNT', 'decimals': 18}
// {'addr': '0xa44e5137293e855b1b7bc7e2c6f8cd796ffcb037', 'name': 'SENT', 'decimals': 8}
// {'addr': '0x5e6b6d9abad9093fdc861ea1600eba1b355cd940', 'name': 'ITC', 'decimals': 18}
// {'addr': '0x48df4e0296f908ceab0428a5182d19b31fc037d6', 'name': 'FRV', 'decimals': 8}
// {'addr': '0x8a99ed8a1b204903ee46e733f2c1286f6d20b177', 'name': 'NTO', 'decimals': 18}
// {'addr': '0x3543638ed4a9006e4840b105944271bcea15605d', 'name': 'UUU', 'decimals': 18}
// {'addr': '0x622dffcc4e83c64ba959530a5a5580687a57581b', 'name': 'AUTO', 'decimals': 18}
// {'addr': '0xe120c1ecbfdfea7f0a8f0ee30063491e8c26fedf', 'name': 'SUR', 'decimals': 8}
// {'addr': '0xbbff862d906e348e9946bfb2132ecb157da3d4b4', 'name': 'SS', 'decimals': 18}
// {'addr': '0x1a95b271b0535d15fa49932daba31ba612b52946', 'name': 'MNE', 'decimals': 8}
