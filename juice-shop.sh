#!/bin/bash

# Update packages
sudo apt -y update

# Installeer nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Source .bashrc maak nvm beschikbaar
source ~/.bashrc

# Installeer Node.js versie 18.16.0
nvm install v18.16.0

# Check Node.js versie
node -v

# Installeer npm
sudo apt -y install npm

# Clone de Juice Shop repository
git clone https://github.com/juice-shop/juice-shop.git --depth 1

# Verander directory naar Juice Shop
cd juice-shop

# Installeer dependencies
yes | npm install

# Start de Juice Shop
npm start