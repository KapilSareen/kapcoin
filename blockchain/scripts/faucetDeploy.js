const hre = require("hardhat");
require('events').EventEmitter.defaultMaxListeners = 25;

async function main() {
  console.log("Starting deployment...");

  try {
    const Faucet = await hre.ethers.getContractFactory("Faucet");
    console.log("Contract factory created.");

    const faucet = await Faucet.deploy("0xDcD6cfE7d9457a2b379aa9DaAc73DED25b0DE13D");
    console.log("Deployment transaction sent. Waiting for confirmation...");

    await faucet.deploymentTransaction()?.wait(1);

    const faucetAddress = await faucet.getAddress();
    console.log("Faucet deployed to:", faucetAddress);
  } catch (error) {
    console.error("Error during deployment:", error);
    throw error;
  }
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });