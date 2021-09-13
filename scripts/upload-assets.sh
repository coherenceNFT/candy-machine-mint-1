#!/bin/bash
set -e # stop script on frist error

# Check assets folder
if [ -d "./assets" ]
then
	if [ "$(ls -A ./assets)" ]; then
    echo "👍 Directory ./assets exists and is not empty"
	else
    echo "⚠️ Error: Directory ./assets is empty. Please create your assets and place them in this folder before running this script."
    exit 1
	fi
else
	echo "⚠️ Error: Directory ./assets does not exists. Please create your assets and place them in this folder before running this script."
  exit 1
fi

# metaplex help upload
solana config get

echo ""
echo "About to run:"
echo ""
echo "metaplex upload ./assets --env devnet --keypair ~/.config/solana/devnet.json" 
echo ""
echo "This command has permanent effects. Are you sure (y/n)? "
read fullname

if [ $fullname == "y" ] ; then
  echo "metaplex upload ./assets --env devnet --keypair ~/.config/solana/devnet.json"
  # metaplex upload ./assets --env devnet --keypair ~/.config/solana/devnet.json
fi
