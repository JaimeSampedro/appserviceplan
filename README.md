azure_appserviceplan
================

Ansible Role Description
------------

This role facilitate the creation of a Windows Web App in the Microsoft Azure Cloud. One
App Service PLan is created as it is needed by the Web App service to run.

Requirements
------------
An Azure Subscription and Resource Group needs to exist before executing the role. Service Principal information will be required and used to preform the provisioning.

Role Variables
--------------
The following is the list of variables that the web app role 

`azure_appserviceplan_subscriptionId`: Azure Suscription Id where the Web App will be created

`azure_appserviceplan_resourceGroupName`: Resource Group container where the recourses will be provisioned

`azure_appserviceplan_action`: Action to be executed within the role. Allowed values: "create", "delete"

`azure_appserviceplan_appServicePlanName`: App Service Plan name.

`azure_appserviceplan_location`: Azure Location where the resources will belong to. 

`azure_appserviceplan_windowsAppServicePlanTier`: App Service Plan of the Azure Service. Permitted values are: "Free", "Shared", "Basic", "Standard", "Premium", PremiumV2"

`azure_appserviceplan_windowsAppServicePlanSize`: The Size of the VMs that run the Apps. The higher this number is, the better the hardware of the underlying VMs is. Allowed values: "1", "2", "3".

`azure_appserviceplan_windowsAppServicePlanInstances`: The amount of instances that will run the App Services in the App Service Plan

`azure_appserviceplan_perSiteScaling`: Per-app scaling at the App Service plan level to allow for scaling an app independently from the App Service plan that hosts it

`azure_appserviceplan_maximumElasticWorkerCount`: Maximum number of total workers allowed for this ElasticScaleEnabled App Service Plan

`azure_appserviceplan_isSpot`: This App Service Plan owns spot instances

`azure_appserviceplan_reserved`: Reserved when linux App Service Plan.

`azure_appserviceplan_isXenon`: Is Xenon boolean App Service Plan setting

`azure_appserviceplan_hyperV`: HyperV Boolean App Service Plan

`azure_appserviceplan_targetWorkerSizeId`: Sets scaling worker size ID

`azure_appserviceplan_targetWorkerCount`: Sets number of Workers

`azure_appserviceplan_isXenon`: Is Xenon App Service Plan setting

`azure_appserviceplan_rgName_actionGroup`: Resource Group name where the action Group is.

`azure_appserviceplan_client_id`: Client Id associated to the Service Principal

`azure_appserviceplan_secret`: Key Secret of the Service Principal

`azure_appserviceplan_tenant`: Tenant related to the Service Principal



Standardized Service Description
------------


[App Service Plan](https://docs.microsoft.com/en-us/azure/app-service/azure-web-sites-web-hosting-plans-in-depth-overview) defines a set of compute resources for App Service to run. These compute resources are analogous to the server farm in conventional web hosting. One or more apps can be configured to run on the same computing resources (or in the same App Service plan).


The main Azure ARM template will be stored in the /templates folder of the role with the follwing name:

  -   Feature.json


Dependencies
------------
The Subscription and Resource Group needs to exist before executing the role. The Windows


Example Playbook
----------------
This is an example of calling role:

- hosts: servers
  roles:
     - { role: azure_appserviceplan, vars:{  
                        azure_appserviceplan_subscriptionId: XX,
                        azure_appserviceplan_resourceGroupName: XX,     
                        azure_appserviceplan_action: XX,                                      
                        azure_appserviceplan_appServicePlanName: XX,
                        azure_appserviceplan_location: XX,
                        azure_appserviceplan_windowsAppServicePlanTier: XX,
                        azure_appserviceplan_windowsAppServicePlanSize: XX,
                        azure_appserviceplan_windowsAppServicePlanInstances: XX,
                        azure_appserviceplan_perSiteScaling:  XX,
                        azure_appserviceplan_maximumElasticWorkerCount:  XX,
                        azure_appserviceplan_isSpot: XX,
                        azure_appserviceplan_reserved:  XX,
                        azure_appserviceplan_isXenon: XX,
                        azure_appserviceplan_hyperV:  XX,
                        azure_appserviceplan_targetWorkerSizeId:  XX,
                        azure_appserviceplan_targetWorkerCount:  XX,
                        azure_appserviceplan_rgName_actionGroup:  XX,
                        azure_appserviceplan_client_id:  XX,
                        azure_appserviceplan_secret:  XX,
                        azure_appserviceplan_tenant:  XX   }}


License
-------
Copyright (c) F. Hoffmann-La Roche Ltd. All rights reserved


Author Information
------------------
Developed by CCC Featured Team
