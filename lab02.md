# Lab02 – Enable SSH access

SSH for Arc-enabled servers enables SSH based connections to Arc-enabled servers without requiring a public IP address or additional open ports. This functionality can be used interactively, automated, or with existing SSH based tooling, allowing existing management tools to have a greater impact on Azure Arc-enabled servers.

SSH access to Arc-enabled servers provides the following key benefits:

- No     public IP address or open SSH ports required
- Access     to Windows and Linux machines
- Ability     to log-in as a local user or an [Azure      user (Linux only)](https://docs.microsoft.com/en-us/azure/active-directory/devices/howto-vm-sign-in-azure-ad-linux)
- Support     for other OpenSSH based tooling with config file support

https://docs.microsoft.com/en-us/azure/azure-arc/servers/ssh-arc-overview



## Create default connectivity endpoint, the following actions must be completed for each Arc-enabled server 

`az rest --method put --uri https://management.azure.com/subscriptions/<subscription>/resourceGroups/<resourcegroup>/providers/Microsoft.HybridCompute/machines/<arc enabled server name>/providers/Microsoft.HybridConnectivity/endpoints/default?api-version=2021-10-06-preview --body '{"properties": {"type": "default"}}'`

 

![A screenshot of a computer  Description automatically generated with medium confidence](/assets/images/lab02/clip_image001.png)

  

### In the VM, Enable functionality on your Arc-enabled server 

`azcmagent config list` 

`azcmagent config set incomingconnections.ports 22` 

![Text  Description automatically generated](/assets/images/lab02/clip_image002.png)

  

### Ensure you have pre installed SSH and SSH client

`sudo apt install openssh-server openssh-client -y`

### In the Azure Portal, go to Cloud Shell and connect using az ssh

`az ssh arc --vm-name lab1 --resource-group demoArcEdge --local-user parallels`

![Text  Description automatically generated](/assets/images/lab02/clip_image003.png)

 

## Testing connectivity through 443

Install Linux firewall and only allow port 443/tcp

`sudo apt install ufw -y`

`sudo ufw allow 443/tcp`

`sudo ufw enable` 

![Text  Description automatically generated](/assets/images/lab02/clip_image004.png)