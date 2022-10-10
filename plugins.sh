#!/bin/bash
nix-env -iA \
   nixpkgs.antibody \
    nixpkgs.zsh \
    nixpkgs.git \
    nixpkgs.neovim \
    nixpkgs.tmux \
    nixpkgs.stow \
    nixpkgs.jq \
    nixpkgs.fzf \
    nixpkgs.ripgrep \
    nixpkgs.alacritty \
    nixpkgs.tree \
#    nixpkgs.kotlin \
#    nixpkgs.kotlin-language-server

# unstable packages
# nix-env -f channel:nixpkgs-unstable -iA \
#    neovim
