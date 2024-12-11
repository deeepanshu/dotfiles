#!/bin/bash

# Update and upgrade the system
echo "Updating and upgrading the system..."
brew update && brew upgrade

# Install Homebrew if not installed
if ! command -v brew &> /dev/null
then
    echo "Homebrew not found, installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install tmux
echo "Installing tmux..."
brew install tmux

# Install tmuxinator
echo "Installing tmuxinator..."
brew install tmuxinator

# Install TPM (Tmux Plugin Manager)
echo "Installing TPM (Tmux Plugin Manager)..."
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm

# Install WezTerm
echo "Installing WezTerm..."
brew tap wez/wezterm
brew install --cask wezterm

# Install Postman
echo "Installing Postman..."
brew install --cask postman

# Install Neovim
echo "Installing Neovim..."
brew install neovim

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install bat
echo "Installing bat..."
brew install bat

# Install lsd
echo "Installing lsd..."
brew install lsd

# Install zoxide
echo "Installing zoxide..."
brew install zoxide

# Install chezmoi
echo "Installing chezmoi..."
brew install chezmoi

# Install fzf
echo "Installing fzf..."
brew install fzf

# Install lazygit
echo "Installing lazygit..."
brew install lazygit

echo "Installing asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2

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
