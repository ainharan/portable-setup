#!/bin/bash
install_nix_package_manager() {
    sh <(curl -L https://nixos.org/nix/install)
}

install_nix_plugins() {
    . ~/.nix-profile/etc/profile.d/nix.sh # set nix environment
    ./plugins.sh
}

install_tmux_plugins() {
    local TPM_DIR=~/.config/tmux/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm $TPM_DIR || 
	    echo "Updating existing repo..."; git --git-dir=$TPM_DIR/.git pull
    ~/.config/tmux/.tmux/plugins/tpm/bin/install_plugins
}

install_zsh_plugins() {
    antibody bundle < ~/.config/zsh/.zsh_plugins.txt > ~/.config/zsh/.zsh_plugins.sh 
}

install_nvim_plugins() {
    local TPM_DIR=~/.local/share/nvim/site/pack/packer/start/packer.nvim
    git clone --depth 1 https://github.com/wbthomason/packer.nvim $TMP_DIR ||
	    echo "Updating existing repo..."; git --git-dir=$TPM_DIR/.git pull
    nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
}

default_zsh_shell() {
    if [[ -z "$(cat < /etc/shells | grep zsh)" ]]; then
        command -v zsh | sudo tee -a /etc/shells 
        sudo chsh -s $(which zsh) $USER
    fi
}

install_plugins() {
    install_nix_plugins
    install_tmux_plugins
    install_zsh_plugins
    install_nvim_plugins
}

configure_dotfiles() {
    local TPM_DIR=~/.dotfiles
    git clone https://github.com/ainharan/dotfiles.git $TMP_DIR ||
	    echo "Updating existing repo..."; git --git-dir=$TPM_DIR/.git pull
    ls -1 ~/.dotfiles | 
        while read folder; do
            stow -d ~/.dotfiles $folder; 
        done
}

main() {
    install_nix_package_manager
    configure_dotfiles
    install_plugins
    default_zsh_shell
}

main "$@"
