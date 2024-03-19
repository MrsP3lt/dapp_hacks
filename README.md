# Introduction
This is repository is an attempt to refactored a version of [DefiHackLabs](https://github.com/SunWeb3Sec/DeFiHackLabs). It aims to adhere to coding best practices and to be more modular.
[Dashboard](https://mrsp3lt.notion.site/9e26a6122c7b4a2497f0a5301c71c934?v=10bb4eb371ce49a587b8e456f4cf69fd&pvs=25)

### Setup
```sh
$ git clone https://github.com/transmissions11/foundry-template.git 
$ cd foundry-template
$ git submodule init 
$ forge build 

```
### Run Tests
```sh
$ forge test --contract ./test/{contract_name}.t.sol -vvv
```
## Contributing
You will need a copy of [Foundry](https://github.com/foundry-rs/foundry) installed before proceeding. See the [installation guide](https://github.com/foundry-rs/foundry#installation) for details.