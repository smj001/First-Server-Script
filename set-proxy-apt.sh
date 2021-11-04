#!/bin/bash
touch /etc/apt/apt.conf.d/proxy.conf
cat << EOF > /etc/apt/apt.conf.d/proxy.conf
Acquire {
  HTTP::proxy "http://65.21.13.253:990/";
  HTTPS::proxy "http://65.21.13.253:990/";
}
EOF
