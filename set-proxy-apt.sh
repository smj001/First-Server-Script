#!/bin/bash
touch /etc/apt/apt.conf.d/proxy.conf
cat << EOF > /etc/apt/apt.conf.d/proxy.conf
Acquire {
  HTTP::proxy "http://188.40.202.116:8585";
  HTTPS::proxy "http://188.40.202.116:8585";
}
EOF
