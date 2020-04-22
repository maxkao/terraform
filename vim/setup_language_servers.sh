#!/bin/bash

# Install packages required for coc.nvim and installed language servers 

# add nodejs ppa 
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y cmake \
    clangd-9 \
    texlive-latex-extra \
    texlive-science \
    nodejs \
    yarn

sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-9 100

# Install dependencies for latex language server
RUN ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime && \
apt-get install -y tzdata &&\
dpkg-reconfigure --frontend noninteractive tzdata  

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
~/.cargo/bin/cargo install --git https://github.com/latex-lsp/texlab.git

# Install dependencies for python language server 
pip install python-language-server pyflakes
