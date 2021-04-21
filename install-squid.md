## Installation:
Centos:
``yum install squid -y``

ubuntu:
``apt-get install squid -y``

## Configuration
Go to `/etc/squid/squid.conf` and change this file like this lines:
```
acl localnet src 10.0.0.0/8	# RFC1918 possible internal network
acl localnet src 172.16.0.0/12	# RFC1918 possible internal network
acl localnet src 192.168.0.0/16	# RFC1918 possible internal network
acl localnet src fc00::/7       # RFC 4193 local private network range
acl localnet src fe80::/10      # RFC 4291 link-local (directly plugged) machines

acl SSL_ports port 443
acl Safe_ports port 80		# http
acl Safe_ports port 21		# ftp
acl Safe_ports port 443		# https
acl Safe_ports port 70		# gopher
acl Safe_ports port 210		# wais
acl Safe_ports port 1025-65535	# unregistered ports
acl Safe_ports port 280		# http-mgmt
acl Safe_ports port 488		# gss-http
acl Safe_ports port 591		# filemaker
acl Safe_ports port 777		# multiling http
acl CONNECT method CONNECT

#auth_param basic program /usr/lib/squid3/basic_ncsa_auth /etc/squid/passwd
#acl ncsa_users proxy_auth REQUIRED
#http_access allow ncsa_users
#http_access allow localnet
#http_access allow localhost

auth_param basic program /usr/lib64/squid/basic_ncsa_auth /etc/squid/htpasswd
auth_param basic realm proxy
acl authenticated proxy_auth REQUIRED
http_access allow authenticated
http_access deny all


#http_access deny all
# Squid normally listens to port 3128
http_port 1433

# Uncomment and adjust the following to add a disk cache directory.
#cache_dir ufs /var/spool/squid 100 16 256

# Leave coredumps in the first cache dir
coredump_dir /var/spool/squid

#
# Add any of your own refresh_pattern entries above these.
#
refresh_pattern ^ftp:		1440	20%	10080
refresh_pattern ^gopher:	1440	0%	1440
refresh_pattern -i (/cgi-bin/|\?) 0	0%	0
refresh_pattern .		0	20%	4320
```

### Authentication Step:
create new user lets run this command: (This command make user with USERNAME and password is PASSWORD, You can change this line)
``printf "USERNAME:$(openssl passwd -crypt PASSWORD)\n" | sudo tee -a /etc/squid/htpasswd``

### Change Port:
Change squid proxy port in ``http_port`` line.

## Ending:
Run this commands for run Squid:
```
systemctl start squid
systemctl enable squid
systemctl restart squid
systemctl status squid
```

Enjoy The world without HAMMALI!
