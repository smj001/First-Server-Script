#!/bin/bash
setenforce 0 && \
  sed -i "s/^SELINUX\=enforcing/SELINUX\=disabled/g" /etc/selinux/config && \
  systemctl disable firewalld; systemctl stop firewalld; systemctl mask firewalld
