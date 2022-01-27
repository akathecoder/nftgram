import { expect } from "chai";
import { log } from "console";
import { ethers } from "hardhat";
import { it } from "mocha";

describe("NftGramMarketplace", function () {
  it("Should deploy and post a NFT on the platform", async () => {
    /** deploy nftgram contract */
    const NftGramContract = await ethers.getContractFactory(
      "NftGramMarketplace"
    );
    const nftGram = await NftGramContract.deploy();
    await nftGram.deployed();
    const nftGramAddress = nftGram.address;
    // log("nftGramAddress: ", nftGramAddress);

    /** deploy nft contract */
    const nftContract = await ethers.getContractFactory(
      "Nft"
    );
    const nft = await nftContract.deploy(nftGramAddress);
    await nft.deployed();
    const nftAddress = nft.address;
    // log("nftAddress: ", nftAddress);

    let postingPrice = await nftGram.getPostingPrice();
    let postingPriceString = postingPrice.toString();

    /** mint a nft */
    await nft.createToken("https://www.mynfttoken.com/");

    /** post the nft on nftgram platform */
    await nftGram.createMarketPost(nftAddress, 1, {
      value: postingPrice,
    });

    /** view the post */
    let myPosts = await nftGram.fetchMyPosts();
    // log("myPosts", myPosts);

    const myPostsRaw = await Promise.all(
      myPosts.map(async (post) => {
        const tokenUri = await nft.tokenURI(post.tokenId);
        return tokenUri.toString();
      })
    );
    // log("myPostsRaw: ", myPostsRaw);
  });
});
