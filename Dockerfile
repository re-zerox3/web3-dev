

FROM node:18


#Install system dependencies
RUN apt-get update && apt-get install -y \
	python3-pip python3-dev build-essential curl git wget libssl-dev  libffi-dev pkg-config \
	&& apt-get clean
#Install pip to avoid compatibility issues
RUN python3 -m pip install --break-system-packages --upgrade pip setuptools wheel



#Install auditing & fuzzing tools
RUN python3 -m pip install --break-system-packages mythril slither-analyzer echidna


# Install Hardhat
RUN npm install -g hardhat truffle ganache

# Install Solidity compiler
RUN npm install -g solc

#Install Foundry (Rust-based tool for fuzzing & testing)
RUN curl -L https://foundry.paradigm.xyz | bash && ~/.foundry/bin/foundryup

#Set working directory
WORKDIR /lab

#Default command
CMD ["/bin/bash"]


