# Candy Machine Mint

The Candy Machine Mint project is designed to let users fork, customize, and deploy their own candy machine mint app to a custom domain ultra fast.

A candy machine is an on-chain Solana program (or smart contract) for managing fair mint.

Fair mints:

- Start and finish at the same time for everyone.
- Won't accept your funds if they're out of NFTs to sell.

The Candy Machine Mint project is meant to be as simple and usable as possible, accessible to everyone from long-time crypto devs to junior React devs with a vague interest in NFTs. Our goal is to empower users to create their own frontends to display, sell, and manage their NFTs as simply as possible by just updating a few styled components and following a well-documented process for setup and shipping.

## Setup

Setup Metaplex and all dependencies

```bash
./ops setup
```

## Configure Solana for Devnet

Devnet serves as a playground for anyone who wants to take Solana for a test drive, as a user, token holder, app developer, or NFT publisher. NFT publishers should target devnet before going for mainnet.

```bash
./ops config-devnet
```

## Organize Assets

Here’s how you should organize the files you want to upload.

Notice that these come in numerical pairs. eg: `4.png` & `4.json` are two halves of the NFT – one is the art, the other is the metadata. If you have a 10k collection then there should be 20k files in this directory.

Also notice that we’re starting with `0.json` + `0.png`, because that’s the default value for the `--start-with`. Staying close to the defaults ensures you don’t have surprises like publishing fewer NFTs than you meant to.

Look in the `assets` folder for example `json` + `png` pairs.

```bash
0.json
0.png
1.json
1.png
2.json
2.png
3.json
3.png
4.json
...
```

## Verify Assets

**Don’t speed run this section. This is where permanent mistakes are made.**

Once all of your assets are organized you can check some basic metrics to make sure everything looks correct.

```bash
./ops verify-assets
```

## Upload Assets

Once you've verified all your assets you can upload them.

Upload sends files to Arweave and also registers those files with your Candy Machine. After a successful run both Arweave and Solana are initialized.

It’s normal for the Upload command to emit numerous errors espescially on larger collections.The program authors are aware of this and carefully designed the program so that it’s safe to simply re-run the upload command until everything goes through completely and cleanly.

Arweave is rarely able to show your your assets right away. It’s not uncommon for me to wait 10-15 minutes to see it serve images and metadata. I don’t fully understand the replication process but know that it takes time.

```bash
./ops upload-assets
```

## Validate Candy Machine

You can confirm the health of your on-chain assets using metaplex verify.

```bash
./ops metaplex-verify

# output:
# Looking at key  0
# Name {redacted-name} 4 with https://arweave.net/{redacted-tx-id} checked out
# Looking at key  1
# Name {redacted-name} 1 with https://arweave.net/{redacted-tx-id} checked out
```

## Resources

- [Metaplex NFT Standard](https://docs.metaplex.com/nft-standard)
