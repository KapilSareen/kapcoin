const hre = require("hardhat");
require('events').EventEmitter.defaultMaxListeners = 25;

async function main() {
  console.log("Starting deployment...");

  try {
    const KapCoin = await hre.ethers.getContractFactory("KapCoin");
    console.log("Contract factory created.");

    const kpcoin = await KapCoin.deploy(100000000, 50);
    console.log("Deployment transaction sent. Waiting for confirmation...");

    await kpcoin.deploymentTransaction()?.wait(1);

    const kpcoinAddress = await kpcoin.getAddress();
    console.log("KapCoin deployed to:", kpcoinAddress);
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