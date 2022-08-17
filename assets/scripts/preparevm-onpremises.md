
# Preparation Linux VM

## Check or change the hostname

sudo nano /etc/hostname
sudo nano /etc/hosts
sudo reboot

## Upadate

sudo apt update

## Network Manager and SSH
sudo apt install network-manager -y
sudo apt install openssh-server openssh-client -y

## Install and configure Firewall

sudo apt install ufw -y
sudo ufw allow 443/tcp
sudo ufw allow 9418/tcp #Arc for Kubernetes
sudo ufw enable
