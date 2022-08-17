# Lab03 – Installing Azure IoT Edge via Azure Arc for Servers



## Creating IoT Hub 

Create IoT Hub with CLI 

`iothubname=youriothubname`

`az iot hub create --name $iothubname --resource-group $myRG --sku S1`

![image-20220817024951373](/assets/images/lab03/20220817024951373.png)

 

Create DPS 

`dpsname=mydpsname`

`az iot dps create --name $dpsname --resource-group $myRG --location westus`

`az iot dps create --name armbladpsiotlab1 --resource-group demoArcEdge --location eastus`

![image-20220817025051164](/assets/images/lab03/20220817025051164.png)



You need your IoT hub's connection string to link it with the Device Provisioning Service. Use the az iot hub show-connection-string command to get the connection string and use its output to set a variable that you will use when you link the two resources.

 

`hubConnectionString=$(az iot hub show-connection-string --hub-name $iothubname --key primary --query connectionString -o tsv)`

`echo $hubConnectionString`



Link the IoT hub and your provisioning service with the az iot dps linked-hub create command.

`az iot dps linked-hub create --dps-name $mydpsname --resource-group $myRG --connection-string $hubConnectionString --location eastus`

![image-20220817025150189](/assets/images/lab03/20220817025150189.png)

 Go to DPS and create a Individual Enrollment

1. Mechanism: Symmetric Key
2. Registration Id: lab1
3. IoT Hub Device ID: lab1
4. IoT Edge device: True

![image-20220817025223708](/assets/images/lab03/20220817025223708.png)

Add a tag in the section Initial Device Twin State:

`"monitoring":"True"`

`{`

 `"tags": {`

  `"monitoring":"True"`

 `},`

 `"properties": {`

  `"desired": {}`

 `}`

`}`

 

![image-20220817025300084](/assets/images/lab03/20220817025300084.png)

 

## Create Blob Storage

https://docs.microsoft.com/en-us/azure/storage/blobs/storage-quickstart-blobs-cli

Create a general-purpose storage account with the az storage account create command. The general-purpose storage account can be used for all four services: blobs, files, tables, and queues.



`saname=mystorageaccount` 

`az storage account create \`

  `--name $saname \`

  `--resource-group $myRG \`

  `--location eastus \`

  `--sku Standard_ZRS \`

  `--encryption-services blob`

  

![image-20220817025333057](/assets/images/lab03/20220817025333057.png)

 

## Create a container 

Blobs are always uploaded into a container. You can organize groups of blobs in containers similar to the way you organize your files on your computer in folders. Create a container for storing blobs with the az storage container create command.

 

`az ad signed-in-user show`

Copy signed-in-user id and create an environment variable 

`signeduserid=**********`

`containername=scripts`



Assing role of Storage Blob Data Contribuitor to the signed user 



`az role assignment create \`

  `--role "Storage Blob Data Contributor" \`

  `--assignee $signeduserid \`

  `--scope "/subscriptions/$mySubscriptionId/resourceGroups/<resource-group>/providers/Microsoft.Storage/storageAccounts/<storage-account>"`



Create the container 



`az storage container create \`

  `--account-name $saname \`

  `--name $containername \`

  `--auth-mode login`

 

![image-20220817025503221](/assets/images/lab03/20220817025503221.png)

Create a file to upload to a block blob. If you're using Azure Cloud Shell, use the following command to create a file

 

Create a new file or get [Arc-Edge/install.sh at main · iotrockstars/Arc-Edge (github.com)](https://github.com/iotrockstars/Arc-Edge/blob/main/install.sh)

 

`nano install.sh`



From DPS get the IDScope, Registration and Symmetric Key and update the file



`IDScope=******`

`RegistrationID=lab1`

`SymmetricKey=*******`

`` 

`wget https://github.com/Azure/iot-edge-config/releases/latest/download/azure-iot-edge-installer.sh -O azure-iot-edge-installer.sh \`

`&& chmod +x azure-iot-edge-installer.sh \`

`&& sudo -H ./azure-iot-edge-installer.sh -s $IDScope -r $RegistrationID -k $SymmetricKey \`

`&& rm -rf azure-iot-edge-installer.sh`



You upload a blob to the container you created in the last step using the az storage blob upload command. 

 Go to Storage Account, Containers and open the container named scripts 

![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab03/clip_image001.png)

 Click on Upload, select the file and Upload 

 

![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab03/clip_image002.png)



 Go to the Server-Azure Arc 

![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab03/clip_image003.png)

  

Go to extensions  

 

![Graphical user interface, application  Description automatically generated](/assets/images/lab03/clip_image004.png)

 

 

Add new extension and select Custom Script Extensionfor Linux - Aure Arc 



![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab03/clip_image005.png)

  

 Select the storage account created

 

![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab03/clip_image007.png)

 

 Select the container scripts

![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab03/clip_image008.png)

 

 Select the file recently uploaded 

![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab03/clip_image009.png)

 

 

Finally in Command 

`sh install.sh` 

 

![Graphical user interface, application  Description automatically generated](/assets/images/lab03/clip_image010.png)

 

Wait for a minutes and then in on-premises VM we can validate the installation of docker and iotedge

`sudo docker ps`

`sudo docker --version` 

`sudo iotedge --version`

 

![A screenshot of a computer  Description automatically generated with medium confidence](/assets/images/lab03/clip_image012.png)

 

 

![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab03/clip_image013.png)

 

 

## Testing the IoT Edge

 

![Graphical user interface, text, application, email, Teams  Description automatically generated](/assets/images/lab03/clip_image014.png)

 

![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab03/clip_image015.png)

 

 

 

![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab03/clip_image016.png)

 

 

 

![Graphical user interface, application  Description automatically generated](/assets/images/lab03/clip_image017.png)

 

 

![Graphical user interface, application  Description automatically generated](/assets/images/lab03/clip_image018.png)

 

 

![Graphical user interface, application  Description automatically generated](/assets/images/lab03/clip_image019.png)

 

 

 

 

![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab03/clip_image020.png)

 

 

 

![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab03/clip_image021.png)

 

 

![Timeline  Description automatically generated](/assets/images/lab03/clip_image022.png)

 

 

 

![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab03/clip_image023.png)

 

 

 

![Text  Description automatically generated](/assets/images/lab03/clip_image024.png)