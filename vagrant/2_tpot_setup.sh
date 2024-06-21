#!/bin/bash
#Download tpot
wget https://github.com/telekom-security/tpotce/archive/refs/tags/24.04.0.zip 
unzip 24.04.0.zip
mv tpotce-24.04.0 tpotce
chmod -R 777 tpotce
cp /vagrant/vagrant/expect.exp /home/vagrant/tpotce/expect.exp

# Change some default values
cp /vagrant/vagrant/customfiles/tpot.yml  /home/vagrant/tpotce/installer/install/tpot.yml
cp /vagrant/vagrant/customfiles/standard.yml  /home/vagrant/tpotce/compose/standard.yml
# Kibana Unique Password
kibanapass=`(sudo head /dev/urandom | tr -dc 'A-Za-z0-9' | head -c 20)`



sed -i "s/changepassword/$kibanapass/g" /home/vagrant/tpotce/expect.exp

# Write info files

mkdir -p /vagrant/IMPORTANTDETAILS/

echo "Kibana details:
URL:https://localhost:64297/
username:kibana
password:"$kibanapass"

Threat Intel Panel:https://localhost:64443/
" > /vagrant/IMPORTANTDETAILS/IMPORTANTCREDENTAILSANDURLDETAILS.txt

machineip=`ip -4 addr show dev eth1 | grep inet | awk '{print $2}' | cut -d/ -f1` || true

echo "$machineip" > /vagrant/IMPORTANTDETAILS/tpotip.txt || true
