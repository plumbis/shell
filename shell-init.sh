#!/usr/bin/env bash

export CHSH=yes
# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Download Jet Brains Mono nerd font
wget "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
wget "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
wget "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
wget "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
mv *.ttf /usr/share/fonts/TTF
fc-cache -fv

# Download p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Move OMZ config files
cp .zshrc ~/.zshrc
cp .p10k.zsh ~/.p10k.zsh

# Copy zsh history
cp /boot/config/.zsh_history ~/.zsh_history

# Set the default shell
chsh -s /bin/zsh
