#!/bin/bash

if [[ -z "$1"  ]]
then
    read -p "Please Enter Your HTTP Proxy: " HTTP_PROXY
else
    HTTP_PROXY=$1
fi


# apt proxy
touch /etc/apt/apt.conf.d/proxy.conf
cat << EOF > /etc/apt/apt.conf.d/proxy.conf
Acquire {
  HTTP::proxy "http://$HTTP_PROXY/";
  HTTPS::proxy "http://$HTTP_PROXY/";
}
EOF

# docker proxy
mkdir -p /etc/systemd/system/docker.service.d/
touch /etc/systemd/system/docker.service.d/proxy.conf
echo "[Service]" >> /etc/systemd/system/docker.service.d/proxy.conf
echo "Environment=\"HTTPS_PROXY=http://$HTTP_PROXY\"" >> /etc/systemd/system/docker.service.d/proxy.conf
echo "Environment=\"NO_PROXY=\"localhost,127.0.0.1,::1\"\"" >> /etc/systemd/system/docker.service.d/proxy.conf
echo " "
echo "============= Proxy in Docker available now ============="
systemctl daemon-reload
systemctl restart docker.service
echo "=================== Docker restarted ===================="

# git proxy
git config --global http.proxy http://$HTTP_PROXY --replace-all

# change dns
apt-get install -y resolvconf
echo 'nameserver 185.51.200.2' > /etc/resolvconf/resolv.conf.d/head
echo 'nameserver 178.22.122.100' >> /etc/resolvconf/resolv.conf.d/head
systemctl restart resolvconf.service
systemctl restart systemd-resolved.service
