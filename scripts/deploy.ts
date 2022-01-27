import { ethers } from "hardhat";

async function main() {
  /** deploy nftgram contract */
  const NftGramContract = await ethers.getContractFactory(
    "NftGramMarketplace"
  );
  const nftGram = await NftGramContract.deploy();
  await nftGram.deployed();
  const nftGramAddress = nftGram.address;
  console.log("nftGramAddress: ", nftGramAddress);

  /** deploy nft contract */
  const nftContract = await ethers.getContractFactory(
    "Nft"
  );
  const nft = await nftContract.deploy(nftGramAddress);
  await nft.deployed();
  const nftAddress = nft.address;
  console.log("nftAddress: ", nftAddress);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
