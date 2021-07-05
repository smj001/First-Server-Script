#!/bin/bash
echo " ======================== update and install ZSH ======================== "
yum update -y
sudo touch /etc/apt/apt.conf.d/proxy.conf
echo "Acquire::http::Proxy \"http://65.21.13.253:1433/\";" > /etc/apt/apt.conf.d/proxy.conf
yum install zsh -y
chsh -s /bin/zsh
zsh --version
usermod -s /usr/bin/zsh $(whoami)
echo " ======================== install powerline font ======================== "
git clone https://github.com/powerline/fonts.git --depth=1
cd fonts
./install.sh
cd ..
rm -rf fonts
# apt-get install powerline fonts-powerline
# install powerlevel9k theme
#apt-get install zsh-theme-powerlevel9k
#echo "source /usr/share/powerlevel9k/powerlevel9k.zsh-theme" >> ~/.zshrc
#apt-get install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#echo "source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
echo " ========================== install OH-MY-ZSH == ======================== "
wget -e use_proxy=yes -e https_proxy=65.21.13.253:1433 https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh install.sh -y
# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# install syntax highliter
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# install theme repo
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# config ~/.zshrc
# select oh-my-zsh theme
sed -i s/robbyrussell/powerlevel9k/g ~/.zshrc
# set oh-my-zsh plugins
sed -i s/"git"/"git golang apt python zsh-autosuggestions kubectl zsh-syntax-highlighting ansible docker docker-compose bundler dotenv osx rake rbenv ruby"/g ~/.zshrc
rm install.sh
echo " ======================== Now ZSH INSTALL, ENJOY ======================== "
zsh
