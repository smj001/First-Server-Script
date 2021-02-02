#!/bin/bash
echo "UPDATE YOUR SYSTEM!!"
apt-get update -y
echo "INSTALL VIM!!"
apt-get install vim -y
echo "INSTALL GIT!!"
apt-get install git -y
echo "INSTALL BASH-COMPLETION"
apt-get install bash-completion -y
bash
echo "INSTALL NET-TOOLS & MTR"
apt-get install net-tools -y
apt-get install mrt -y
echo "INSTALL HTOP"
apt-get install htop -y 
