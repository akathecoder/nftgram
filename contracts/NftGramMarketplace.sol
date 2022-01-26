// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

contract NftGramMarketplace is ReentrancyGuard, IERC721Receiver {
    using Counters for Counters.Counter;
    Counters.Counter private _itemIds;

    address payable internal owner;
    uint256 internal postingPrice = 0.025 ether;

    constructor() {
        owner = payable(msg.sender);
    }

    function onERC721Received(
        address,
        address,
        uint256,
        bytes memory
    ) public virtual override returns (bytes4) {
        return this.onERC721Received.selector;
    }

    struct Post {
        uint256 itemId;
        address nftContract;
        uint256 tokenId;
        address payable owner;
    }

    mapping(uint256 => Post) private idToPost;

    event PostCreated(
        uint256 indexed itemId,
        address indexed nftContract,
        uint256 indexed tokenId,
        address owner
    );

    function getPostingPrice() public view returns (uint256) {
        return postingPrice;
    }

    function createMarketPost(address nftContract, uint256 tokenId)
        public
        payable
        nonReentrant
    {
        require(msg.value == postingPrice, "Insufficient posting price paid");

        _itemIds.increment();
        uint256 itemId = _itemIds.current();

        idToPost[itemId] = Post(
            itemId,
            nftContract,
            tokenId,
            payable(msg.sender)
        );

        emit PostCreated(itemId, nftContract, tokenId, msg.sender);
    }

    function fetchPosts() public view returns (Post[] memory) {
        uint256 itemCount = _itemIds.current();
        uint256 currentIndex = 0;
        Post[] memory items = new Post[](itemCount);

        for (uint256 i = 0; i < itemCount; i++) {
            uint256 currentId = i + 1;
            Post storage currentItem = idToPost[currentId];
            items[currentIndex] = currentItem;
            currentIndex += 1;
        }

        return items;
    }

    function fetchMyPosts() public view returns (Post[] memory) {
        uint256 totalItemCount = _itemIds.current();
        uint256 itemCount = 0;
        uint256 currentIndex = 0;

        for (uint256 i = 0; i < totalItemCount; i++) {
            if (idToPost[i + 1].owner == msg.sender) {
                itemCount += 1;
            }
        }

        Post[] memory items = new Post[](itemCount);
        for (uint256 i = 0; i < totalItemCount; i++) {
            if (idToPost[i + 1].owner == msg.sender) {
                uint256 currentId = i + 1;
                Post storage currentItem = idToPost[currentId];
                items[currentIndex] = currentItem;
                currentIndex += 1;
            }
        }
        return items;
    }
}
