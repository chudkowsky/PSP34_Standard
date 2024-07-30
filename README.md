#  ArtZero NFT contract and IPFS file deployment
### Welcome to the ArtZero guide for deploying an NFT smart contract on the blockchain and storing files on IPFS (InterPlanetary File System). This comprehensive README will guide you through the entire process, ensuring you can deploy your smart contract and store your files offchain.
> ### [Prerequisites](#prerequisites)
> ### [Setting up enviroment](#setting-up-enviroment)
> ### [Setting up AlephZero Wallet](#setting-up-alephwallet)
> ###  [Compiling and deploying the contract](#compiling-and-deploying-the-contract)
> ### [Setting up IPFS](#setting-up-ipfs)
> ###  [Adding files to IPFS](#adding-files-to-ipfs)  

## Prerequisites
Asdf, Go, Ink, Rust, Ipfs (kubo)
## Setting up enviroment
### Installing Rust
To download Rustup and install Rust, run the following in your terminal, then follow the on-screen instructions.
`curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
### Installing Ink
In addition to Rust, installation requires a C++ compiler that supports C++17. Modern releases of gcc and clang, as well as Visual Studio 2019+ should work. Follow the provided commands below:

1. `rustup component add rust-src`
2. `cargo install --force --locked cargo-contract`
3.  Install dependencies for linting:  
    `export TOOLCHAIN_VERSION=nightly-2024-02-08`  
    `rustup install $TOOLCHAIN_VERSION`  
    `rustup component add rust-src --toolchain $TOOLCHAIN_VERSION`  
    `rustup run $TOOLCHAIN_VERSION cargo install cargo-dylint dylint-link`  

### Installing adsf 

### Installing Go language

### Install IPFS (kubo) 
Once we succesfully installed Go language we can proceed to installing IPFS
1. Download the Linux binary  
`wget https://dist.ipfs.tech/kubo/v0.29.0/kubo_v0.29.0_linux-amd64.tar.gz`
2. Unzip the file:  
`tar -xvzf kubo_v0.29.0_linux-amd64.tar.gz`
3. Move into the kubo folder:  
`cd kubo`
4. Run the install script:  
`sudo bash install.sh`
5. Test that Kubo has installed correctly:  
`ipfs --version `  
Expected output should look like:  
`ipfs version 0.29.0`
## Setting up AlephWallet 
To setup wallet follow the official instruction: https://docs.alephzero.org/aleph-zero/use/wallets   
Make sure to save 12 word passphrase, and wallet address.
## Compiling and deploying the contract   
1. To deploy the contract we need to compile it first, using cargo contract:   
`cargo contract build --release`
After compilation proccess generates 3 files and saves them in `alephzero-nft/alephzero_nft/target/ink`
- <your_contract>.contract (code + metadata)
- <your_contract>.wasm (the contract's code)
- <your_contract>.json (the contract's metadata)  
2. We have to create a file in main directory `.env` where we will store neccesery data for deployment. The `.env` should contain:  
`export SEED="<your wallet 12 word seed phrase>"`  
`export URL="wss://ws.test.azero.dev"` 
`export WALLET_ADDRESS = <your wallet address>`

3. After setuping envs we can run deployment script, make sure you are in proper directory: `alephzero-nft/alephzero_nft`  
`./scripts/deploy.sh`

## Setting up IPFS
1. Once you have Kubo installed, we need to get our node up and running. If this is your first time using Kubo, you will first need to initialize the configuration files:   
`ipfs init`  
2. We're now ready to start the IPFS daemon to bring the node online. Run the ipfs daemon command:  
`ipfs daemon`
## Adding files to IPFS
1. To add files,while daemon work, open another terminal and navigate to the directory containing the file or folder you wish to share or provide a relative path to it:  
`ipfs add <your file>`   
This will output something like:  
`added QmRgR7Bpa9xDMUNGiKaARvFL9MmnoFyd86rF817EZyfdGE <your file>`  
`6 B / 6 B [==========================================================] 100.00`   
Make sure to save generated hash, it will be important later
