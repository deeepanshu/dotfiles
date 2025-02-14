#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
brew update && brew upgrade

# Install Homebrew if not installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found, installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    PATH=$PATH:/opt/homebrew/bin
    export PATH=$PATH:/opt/homebrew/bin
fi


# Installing cli tools
echo "Installing cli tools"
brew install bat lsd zoxide chezmoi lazygit asdf neovim tmux tmuxinator tmux-sessionizer ripgrep git-delta

# Install TPM (Tmux Plugin Manager)
echo "Installing TPM (Tmux Plugin Manager)..."
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# Install Postman
echo "Installing Postman..."
brew install --cask postman


# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "ZSH CUSTOM PATH: $ZSH_CUSTOM"
if [ -z "$ZSH_CUSTOM" ]; then 
    ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
fi

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
git clone https://github.com/davidparsson/zsh-pyenv-lazy.git $ZSH_CUSTOM/plugins/pyenv-lazy


# Install fzf
echo "Installing fzf..."
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install


echo "Installing starship..."
brew install starship

echo "Installing ghostty"
brew install --cask ghostty

# Install asdf plugin for zulujdk
echo "Installing asdf plugin for zulujdk..."
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf install java zulu-21.38.21
asdf global java zulu-21.38.21
asdf local java zulu-21.38.21

# Install asdf plugin for nodejs
echo "Installing asdf plugin for nodejs..."
asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest

echo "Setup complete!"
