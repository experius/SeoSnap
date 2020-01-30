#!/bin/sh

sudo sh -c "echo '{ \"iptables\": false }' >> /etc/docker/daemon.json && systemctl restart docker"

sudo ufw default deny incoming
sudo ufw allow from myip to any port 22
sudo ufw allow from myip to any port 8080
sudo ufw allow from myip to any port 5000
sudo ufw enable