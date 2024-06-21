#!/bin/bash
mkdir -p /app/builddocker/

cp -a /vagrant/code/. /app/builddocker/

#Random DB Password
rootpass=`(sudo head /dev/urandom | tr -dc 'A-Za-z0-9' | head -c 20)`
normalpass=`(sudo head /dev/urandom | tr -dc 'A-Za-z0-9' | head -c 20)`
sed -i "s/\[ROOT_PASS_TO_REPLACE\]/$rootpass/g" /app/builddocker/docker-compose.yml
sed -i "s/\[DB_PASSWORD_TO_REPLACE\]/$normalpass/g" /app/builddocker/docker-compose.yml
sed -i "s/DB_PASSWORD_TO_REPLACE/$normalpass/g" /app/builddocker/panel/config/web_config.env

# Setup ThreatIntel Service
apt-get install python3-requests -y
mkdir -p /app/dt/data/
mkdir -p /processed_files/
mkdir -p /app/dt/data/tmp_hash_checked/
cp -r /vagrant/code/threat_intel/ /app/dt/threat_intel/
mkdir -p /app/dt/threat_intel/config/
mkdir -p /app/dt/threat_intel/logs/
chmod -R 777 /app/dt/threat_intel/logs/
chmod -R 777 /app/dt/threat_intel/config/
chown tpot:tpot -R /app/dt/threat_intel/
chmod -R 775 /app/builddocker/panel/

ln -s /home/vagrant/tpotce/data/dionaea/binaries/ /app/dt/data/malware_samples
chmod -R 777 /app/dt/data/
chmod -R 777 /processed_files/



cp /app/dt/threat_intel/src/threat-intel.service /etc/systemd/system/threat-intel.service
cd /app/builddocker/

make setup
sudo chmod 644 /app/panel/certs/panel.crt
sudo chmod 644 /app/panel/certs/panel.key
make up_build

# Enable services
systemctl daemon-reload
systemctl enable threat-intel.service
systemctl start threat-intel.service
