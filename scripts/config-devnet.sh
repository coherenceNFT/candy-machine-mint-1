# I highly recommend making devnet your default solana url
solana config set --url https://api.devnet.solana.com

# Read the manual on keygen before running the next command
solana-keygen help new

# Create devnet wallet for testing
# Redact your mnemonic, store it somewhere safe and take advantage of the --outfile flag.
# Make sure you save this seed phrase and your BIP39 passphrase to recover your new keypair
solana-keygen new --outfile ~/.config/solana/devnet.json

# I also recommend making devnet your default keypair:
solana config set --keypair ~/.config/solana/devnet.json

# Read these manuals before running the next commands
solana help config
solana help balance
solana help airdrop

# Make sure you're on Devnet
solana config get
# output:
# Config File: /Users/levi/.config/solana/cli/config.yml
# RPC URL: https://api.devnet.solana.com
# WebSocket URL: wss://api.devnet.solana.com/ (computed)
# Keypair Path: /Users/levi/.config/solana/devnet.json
# Commitment: confirmed

# Fund devnet test wallet
solana balance
solana airdrop 10
solana balance
# output: 10 SOL