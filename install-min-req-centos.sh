#!/bin/bash
echo "UPDATE YOUR SYSTEM!!"
yum update -y
echo "INSTALL VIM!!"
yum install vim -y
echo "INSTALL GIT!!"
yum install git -y
echo "INSTALL BASH-COMPLETION"
yum install bash-completion bash-completion-extras -y
bash
echo "INSTALL NET-TOOLS & MTR"
yum install net-tools -y
yum install mrt -y
echo "INSTALL HTOP"
yum install htop -y 
