#!/bin/bash

yum install -y yum-utils
yum-config-manager  --add-repo  https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io -y
echo "---------------- docker version ----------------"
docker --version
echo "------------------------------------------------"
systemctl start docker
systemctl enable docker
echo "-----------installing docker-compose------------"
curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
echo "------------ docker-compose version ------------"
docker-compose --version
echo "------------------------------------------------"

