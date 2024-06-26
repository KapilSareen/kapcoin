# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a Hardhat Ignition module that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat ignition deploy ./ignition/modules/Lock.js
```




### commands 
 #### Blockchain part

Set-up
- cd blockchain 
- npm init -y
- npm install --save-dev @nomicfoundation/hardhat-toolbox
- npx hardhat
- npm i @openzeppelin/contracts


After writing code:
- npx hardhat compile
- npx hardhat run --network sepolia scripts/deploy.js



Addresses: 
- token at: 0xDcD6cfE7d9457a2b379aa9DaAc73DED25b0DE13D
- faucet at: 0xDe1f0Bb69D3628B91f9F1decfbe0ad99b6AAC323