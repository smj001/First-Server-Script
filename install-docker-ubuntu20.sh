#!/bin/bash

apt update -y
apt install ca-certificates curl gnupg lsb-release git vim bash-completion wget -y

echo 'nameserver 185.51.200.2' > /etc/resolv.conf
echo 'nameserver 178.22.122.100' >> /etc/resolv.conf
HTTP_PROXY='https_proxy=65.21.13.253:990'
export $HTTP_PROXY
wget https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/containerd.io_1.4.6-1_amd64.deb
wget https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-ce-cli_20.10.7~3-0~ubuntu-focal_amd64.deb
wget https://download.docker.com/linux/ubuntu/dists/focal/pool/stable/amd64/docker-ce_20.10.7~3-0~ubuntu-focal_amd64.deb

dpkg -i containerd.io_1.4.6-1_amd64.deb
dpkg -i docker-ce-cli_20.10.7~3-0~ubuntu-focal_amd64.deb
dpkg -i docker-ce_20.10.7~3-0~ubuntu-focal_amd64.deb

docker run hello-world
docker ps -a
