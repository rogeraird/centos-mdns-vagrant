#!/usr/bin/env bash

yum update; yum upgrade -y

echo gitlab.local > /etc/hostname

# Enable mDNS, so that ansible can access the box by hostname
curl http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-7.noarch.rpm -o epel-release-7-7.noarch.rpm
rpm -ivh epel-release-7-7.noarch.rpm
rm epel-release-7-7.noarch.rpm
yum install -y nss-mdns avahi

# Allow UDP traffic to mDNS port
iptables -A INPUT -p udp -m udp --dport 5353 -j ACCEPT
service avahi-daemon start

# Add ssh key to authorized_keys for ansible
cat ssh_key.pub >> ~/.ssh/authorized_keys
rm ssh_key.pub
