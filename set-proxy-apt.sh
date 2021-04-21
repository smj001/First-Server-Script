#!/bin/bash
touch /etc/apt/apt.conf.d/proxy.conf
cat << EOF > /etc/apt/apt.conf.d/proxy.conf
Acquire {
  HTTP::proxy "http://arazcloud:4r4zCl0uD@65.21.28.172:1433/";
  HTTPS::proxy "http://arazcloud:4r4zCl0uD@65.21.28.172:1433/";
}
EOF
