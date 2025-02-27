#!/usr/bin/env bash

# Delay running after array start
sleep 120

export CHSH=yes
# install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Download Jet Brains Mono nerd font
wget --spider -P /usr/share/fonts/TTF "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf"
wget --spider -P /usr/share/fonts/TTF "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf"
wget --spider -P /usr/share/fonts/TTF "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf"
wget --spider -P /usr/share/fonts/TTF "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf"
fc-cache -fv

# Download p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/.oh-my-zsh/custom/themes/powerlevel10k

# Move OMZ config files
cp .zshrc /root/.zshrc
cp .p10k.zsh /root/.p10k.zsh

# Copy zsh history
cp /boot/config/.zsh_history /root/.zsh_history

# Set the default shell
chsh -s /bin/zsh
