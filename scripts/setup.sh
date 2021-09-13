#!/bin/bash
set -e # stop script on frist error

# Check operating system
if [ "$(uname)" == "Darwin" ]; then
  echo "👍 Operating system is macOS"
else
  echo "🚫 This install script only works on macOS for now. Exiting."
  exit 1
fi

# Check for node
if node --version > /dev/null 2>&1; then
  echo "👍 Found node"
else
  echo "⚠️ node is not installed. Installing..."
  brew install node
  source ~/.bash_profile
fi

# Check for yarn
if yarn --version > /dev/null 2>&1; then
  echo "👍 Found yarn"
else
  echo "⚠️ yarn is not installed. Installing..."
  npm install -g yarn
  source ~/.bash_profile
fi

# Check for Solana CLI
# https://docs.solana.com/cli/install-solana-cli-tools
if solana --version > /dev/null 2>&1; then
  echo "👍 Found solana"
else
  echo "⚠️ solana is not installed. Installing..."
  sh -c "$(curl -sSfL https://release.solana.com/v1.7.11/install)"
  source ~/.bash_profile
  solana-install update
fi

# Install Candy Machine dependency
# We want to run this every time because it is good to start fresh for debugging dependency issues
echo "👍 Install frontend dependencies"
cd frontend
rm -rf frontend/node_modules
yarn install
yarn build
cd ..

# Check for metaplex
if metaplex --version > /dev/null 2>&1; then
  echo "👍 Found metaplex"
else
  echo "⚠️ metaplex is not installed. Installing..."
  git clone git@github.com:metaplex-foundation/metaplex.git
  cd metaplex/js/packages/cli
  yarn install
  yarn build
  # yarn package:macos
  # TODO: use command above unless it fails then use the command below (or figure out why it fails for some in the first place)
  npx pkg . -d --targets node14-macos-x64 --output bin/macos/metaplex
  echo 'export PATH="'$PWD'/bin/macos:$PATH"' >> ~/.bash_profile
  source ~/.bash_profile
  cd ../../../../
fi