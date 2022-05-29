#!/bin/bash
apt update -y
apt install git curl wget vim -y
apt install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i "s/ZSH_THEME\=\"robbyrussell\"/ZSH_THEME\=\"powerlevel10k\/powerlevel10k\"/g" ~/.zshrc
sed -i "s/^plugins/\#plugins/g" ~/.zshrc
echo 'plugins=(git docker zsh-syntax-highlighting zsh-autosuggestions screen sudo systemd zsh-interactive-cd zsh-navigation-tools colored-man-pages)' >> ~/.zshrc
chsh -s `which zsh`
