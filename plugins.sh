#!/bin/bash
#required for running alacritty: nixGL alacritty
nix-channel --add https://github.com/guibou/nixGL/archive/main.tar.gz nixgl && nix-channel --update
nix-env -iA \
    nixgl.auto.nixGLDefault \
    nixpkgs.antibody \
    nixpkgs.zsh \
    nixpkgs.git \
    nixpkgs.neovim \
    nixpkgs.tmux \
    nixpkgs.stow \
    nixpkgs.jq \
    nixpkgs.fzf \
    nixpkgs.fd \
    nixpkgs.ripgrep \
#    nixpkgs.alacritty \
    nixpkgs.tree \
#    nixpkgs.kotlin \
#    nixpkgs.kotlin-language-server



# unstable packages
# nix-env -f channel:nixpkgs-unstable -iA \
#    neovim
