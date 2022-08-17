

Id acea0c3c-8687-412e-8949-9f04c7d96d96
az ad sp create-for-rbac -n "ArcEdge" --role "Contributor" --scopes /subscriptions/$subscriptionId
az ad sp create-for-rbac -n "ArcEdge" --role "Contributor" --scopes /subscriptions/acea0c3c-8687-412e-8949-9f04c7d96d96

az ssh arc --local-user parallels --resource-group demoArcEdge --name lab1


##Preparation Linux VM

Check or change the hostname
sudo nano /etc/hostname
sudo nano /etc/hosts
sudo reboot


sudo apt update
sudo apt install network-manager -y
sudo apt install openssh-server openssh-client -y

Install and configure Firewall

sudo apt install ufw -y
    8  sudo ufw allow 443/tcp
    9  sudo ufw enable



az iot hub create --name armblaiotlab1 --resource-group demoArcEdge --sku S1



