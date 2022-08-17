# Lab01 – Azure Arc for servers Onboarding existing Linux Server.

 

## Create a VM and onboarding it on Azure Arc 

### Overview  

Azure Arc-enabled servers lets you manage Windows and Linux physical servers and virtual machines hosted outside of Azure, on your corporate network, or other cloud provider. This management experience is designed to be consistent with how you manage native Azure virtual machines, using standard Azure constructs such as Azure Policy and applying tags. 

https://docs.microsoft.com/en-us/azure/azure-arc/servers/overview 

Prerequisites 

\- Physical servers and virtual machines hosted outside of Azure. Azure Arc-enabled servers do not support installing the agent on virtual machines running in Azure, or on virtual machines running on Azure Stack Hub or Azure Stack Edge, as they are already modeled as Azure VMs and able to be managed directly in Azure. 

  \- In this case, the lab will use an on-premises Virtual Machine Linux Ubuntu 20 VM. Arc supports the following operating systems https://docs.microsoft.com/en-us/azure/azure-arc/servers/prerequisites#supported-operating-systems 

\- Local admin privileges on Virtual Machine 



## Instructions 

 

Get subscription, copy an create a env variable

`az account show`
`mySubscriptionId=xxxx-xxxxx-xxxx-xxxx`
 

Create a group of Azure resources; we will use the SSH access function (PREVIEW). For that reason, we are going to create it in the eastus region


`myRG=demoArcEdge`

`myRegion=eastus` 

`az group create --name $myRG --location $myRegion`

Go to the Azure portal and Create a new resource, in **IT& Management Tools**, Select **Create Server - Arc** 

 

![Graphical user interface, application  Description automatically generated](/assets/images/lab01/clip_image002.png)

 

In **Add Servers with Arc**, select **Add single server** option and click on **Generate script** button

![Graphical user interface, text, application, Word  Description automatically generated](/assets/images/lab01/clip_image003.png)

 

Select subscription, Recourse Group and Linux in Operating system

 

![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab01/clip_image004.png)

 

Select Next

![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab01/clip_image005.png)

 

Define your locations tags and next

 

![Graphical user interface  Description automatically generated](/assets/images/lab01/clip_image006.png)

 

Don’t close the window and copy the script.

![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab01/clip_image007.png)

 

In your VM paste the script

 

![Graphical user interface, text  Description automatically generated](/assets/images/lab01/clip_image008.png)

 

Last script requires authenticate in the portal, please open the URL and put the verification code

 

![A screenshot of a computer  Description automatically generated with medium confidence](/assets/images/lab01/clip_image009.png)

 

![A picture containing text, businesscard, screenshot  Description automatically generated](/assets/images/lab01/clip_image010.png)

 

When you done, return to Azure and validate in your RG the Server – Azure Arc

 

![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab01/clip_image011.png)

 

Now you can manage this server with Azure

 

![Graphical user interface, application  Description automatically generated](/assets/images/lab01/clip_image012.png)

 

Go to Insights and click on Enable button.

 

![Graphical user interface, text, application  Description automatically generated](/assets/images/lab01/clip_image013.png)

 

Select Azure Monitor agent and click on Configure

 

![Graphical user interface, text, application, email  Description automatically generated](/assets/images/lab01/clip_image014.png)

 