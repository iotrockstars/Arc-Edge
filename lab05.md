# Lab05 – Implementing microk8s

## Description
TO DO

## Labs goals

Using SSH or connecting directly to the VM

## Install microk8s

`sudo snap install microk8s --classic`


You may need to configure your firewall to allow pod-to-pod and pod-to-internet communication

`sudo ufw allow in on cni0 && sudo ufw allow out on cni0`
`sudo ufw default allow routed`

`sudo usermod -a -G microk8s parallels`
`sudo usermod -a -G microk8s parallels`

`newgrp microk8s`

`reboot`

Enable Addons

`microk8s enable dns dashboard storage`

Deploy a demo app

`microk8s kubectl get all --all-namespaces`
`microk8s kubectl create deployment microbot --image=dontrebootme/microbot:v1`
`microk8s kubectl scale deployment microbot --replicas=2`

Create a service

`microk8s kubectl expose deployment microbot --type=NodePort --port=80 --name=microbot-service`
`microk8s kubectl get all --all-namespaces`



## Install Azure CLI

The Azure CLI team maintains a script to run all installation commands in one step. This script is downloaded via curl and piped directly to bash to install the CLI.

If you wish to inspect the contents of the script yourself before executing, simply download the script first using curl and inspect it in your favorite text editor.

`curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash`

``

## Install kubectl

https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/

`sudo snap install kubectl --classic`
`kubectl version --client`


## Connect Kubectl with microk8s

`kubectl config set-cluster microk8s --server=https://127.0.0.1:16443/ --certificate-authority=/var/snap/microk8s/current/certs/ca.crt`
`kubectl config set-credentials microk8s-admin --token=$(microk8s kubectl config view --raw -o 'jsonpath={.users[0].user.token}')`
`kubectl config set-context microk8s --cluster=microk8s --namespace=default --user=microk8s-admin`

## Install Helm

`sudo snap install helm --classic`


