#!/bin/bash
set -e # stop script on frist error

# Check for .env file
if [ -d "./frontend/.env" ] 
then
  echo "👍 File ./frontend/.env exists." 
else
  echo "⚠️ File ./frontend/.env does not exists. Creating..."
  touch ./frontend/.env
  cat metaplex/cache/temp
  # TODO: parse temp file and pull out env variables
  echo 'REACT_APP_CANDY_MACHINE_ID="redacted"' >> ./frontend/.env
  echo 'REACT_APP_CANDY_MACHINE_CONFIG="redacted"' >> ./frontend/.env
  echo "" >> ./frontend/.env
  echo 'REACT_APP_SOLANA_NETWORK=devnet' >> ./frontend/.env
  echo 'REACT_APP_SOLANA_NETWORK=REACT_APP_SOLANA_RPC_HOST=https://explorer-api.devnet.solana.com' >> ./frontend/.env
  echo 'REACT_APP_TREASURY_ADDRESS="redacted"' >> ./frontend/.env
fi