#!/bin/bash
mkdir -p /etc/systemd/system/docker.service.d/
touch /etc/systemd/system/docker.service.d/proxy.conf
echo "[Service]" >> /etc/systemd/system/docker.service.d/proxy.conf
echo "Environment=\"HTTPS_PROXY=http://65.21.13.253:1433\"" >> /etc/systemd/system/docker.service.d/proxy.conf
echo "Environment=\"NO_PROXY=\"localhost,127.0.0.1,::1\"\"" >> /etc/systemd/system/docker.service.d/proxy.conf
echo " "
echo "============= Proxy in Docker available now ============="
systemctl daemon-reload
systemctl restart docker.service
echo "=================== Docker restarted ===================="
