#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
#
rm /vagrant/Vagrantfile
cp /vagrant/Vagrantfile.restore /vagrant/Vagrantfile
# Update
sudo apt-get update -y 
# Permission set
mkdir -p /app/dt/panel/
chown -R vagrant:vagrant /app/dt/
#Change DNS
sudo apt-get install resolvconf -y
sudo echo "nameserver 8.8.8.8" >> /etc/resolvconf/resolv.conf.d/base
sudo echo "nameserver 8.8.4.4" >> /etc/resolvconf/resolv.conf.d/base
resolvconf -u
sudo resolvconf -u
# Add Docker's official GPG key:
## necessary tools install
sudo apt install net-tools sudo wget nano telnet resolvconf vim -y
sudo apt install acl unzip make -y
sudo apt install expect unzip -y


