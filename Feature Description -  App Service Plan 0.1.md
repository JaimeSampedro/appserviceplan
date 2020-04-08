# Roche Cloud Competence Center Feature Description
## Azure App Service Plan v0.1


08-04-2020


| Person | Function | Date of Approval |
| ---    | ---      | ---              |

# Table of content

[1. High level feature description](#1\.-high-level-feature-description)
- [1.1.        High level feature description](#1\.1\.-high-level-feature-description)
- [1.2.        Example purposes and usage](#1\.2\.-example-purposes-and-usage)
- [1.3.        Network topology](#1\.3\.-network-topology)
- [1.4.        Azure service(s) in scope](#1\.4\.-azure-service(s)-in-scope)
- [1.5.        Azure services(s) needed (prerequisites)](#1\.5\.-azure-services(s)-needed-(prerequisites))
- [1.6.        Other limitations](#1\.6\.-other-limitations)

[2. Terms of Use](#2\.-terms-of-use)
- [2.1.        General](#2\.1\.-general)
- [2.2.        Specific Terms of Use for this Feature ](#2\.2\.-specific-terms)

[3.        Provisioning instructions](#3\.-provisioning-instructions)
- [3.1.        Provisioning (GUI)](#3\.1\.-provisioning-gui)
- [3.2.        Deprovisioning (GUI)](#3\.2\.-deprovisioning-gui)
- [3.3.        Provisioning (API)](#3\.3\.-provisioning-api)
- [3.4.        Deprovisioning (API)](#3\.4\.-deprovisioning-api)

[4. Service management](#4\.-service-management)
- [4.1.        Support](#4\.1\.-support)
- [4.2.        Request fulfillment](#4\.2\.-request-fulfillment)
- [4.3.        Backup and disaster recovery](#4\.3\.-backup-and-disaster-recovery)
- [4.4.        Capacity](#4\.4\.-capacity)
- [4.5.        High Availability](#4\.5\.-high-availability)
- [4.6.        Pricing & efficient consumption](#4\.6\.-pricing)
- [4.7.        Administrative Model](#4\.7\.-administrative-model)
- [4.8.        Monitoring](#4\.8\.-monitoring)

[5.        Security](#5\.-security)
- [5.1.        Foundation controls](#5\.1\.-foundation-controls)
- [5.2.        Standard controls](#5\.2\.-standard-controls)
- [5.3.        Complementary advanced controls](#5\.3\.-complementary-advanced-controls)


# 1. High level feature description
## 1.1. High level feature description

In App Service, an app runs in an App Service plan. The compute resources you use for App service is determined by the **App Service plan** that you run your apps on.

These compute resources are analogous to the server farm in conventional web hosting. One or more apps can be configured to run on the same computing resources (or in the same App Service plan).

More information is available in [Azure App Service Plan Documentation](https://docs.microsoft.com/es-es/azure/app-service/overview-hosting-plans)


## 1.2. Example purposes and usage
- This needs to come in the card from the customer team. TO complete!.


## 1.3. Network topology

The Azure App Service scale units support many customers in each deployment. The Free and Shared SKU plans host customer workloads on multi-tenant workers. The Basic, and above plans host customer workloads that are dedicated to only one App Service plan (ASP). If you had a Standard App Service plan, then all of the apps in that plan will run on the same worker. If you scale out the worker, then all of the apps in that ASP will be replicated on a new worker for each instance in your ASP. The workers that are used for Premiumv2 are different from the workers used for the other plans.



## 1.4. Azure service(s) in scope
For this Feature the Azure services in scope are:
-   App service Plan
Azure Web App can run over App Service Plans

## 1.5. Azure services(s) needed (prerequisites)
Resources given by the Cloud Competence Center that need to be in place:
-	Azure Subscription
-  Azure Active Directory

Resources to be deployed to the Jenkins repository before deploying this resource:
-   Resource Group


## 1.6. Other limitations
- Windows App Service limits per Azure subscription (https://docs.microsoft.com/en-us/azure/azure-subscription-service-limits#app-service-limits)

- There is a current limitation in regards to not mixing Windows and Linux apps in the same resource group as well


# 2. Terms of Use
## 2.1. General
All certified Features are bound to the General Terms of Use that are defined in the file [GeneralTerms.md](https://bitbk.roche.com/projects/CCCFEAT/repos/ccc-feature/browse/GeneralTerms%20.md))


## 2.2 Specific Terms of Use for this Feature
**Cloud consumer's responsibilities**: The Customer is responsible for use, consumption and data and code of the 
App Service Plan.

**Infrastructure services** such as Monitoring and backup will be provided by GIS.



# 3. Provisioning Instructions

## 3.1. Provisioning (GUI)
An Azure Windows Web App in the requested location can be provisioned through the Servicenow CMP tool for Roche, in the Category Compute of the Catalog. 
The customer must fill the Windows Web App form and submit the creation request, that will trigger the provisioning process.

The provision process starts with the following Service Now form that the customer will fulfill:

| Field                              | Description                                                  |   |   |   |
|------------------------------------|--------------------------------------------------------------|---|---|---|
| Ation                              | Action to perform over the feature: create or delete         |   |   |   |
| SubscriptionID                     | Subscription where the customer has permissions              |   |   |   |
| AppServicePlanName                 | Name of the Service Plan related to the Windows Web App      |   |   |   |
| LocatioAppServicePlanNamen         | Location to use for provision (between allowed regions)      |   |   |   |
| allocation                         | Allocation to use in the Resource Group Name composition     |   |   |   |
| environment                        | Environment where to deploy "Production" or "Non-Production" |   |   |   |
| projectName                        | Project name to use in the Resource Group name               |   |   |   |
| WindowsAppServicePlanTier          | App Service Plan name for the Windows Web App                |   |   |   |
| WindowsAppServicePlanSize          | Plan Size for the App Service Plan                           |   |   |   |
| windowsAppServicePlanInstances     | The amount of instances that will run in the App Service     |   |   |   |
| perSiteScaling                     | Per-app scaling at the App Service plan level                |   |   |   |
| maximumElasticWorkerCount          | Maximum number of total workers allowed                      |   |   |   |
| isSpot                             | If this App Service Plan owns spot instances                 |   |   |   |
| reserved                           | Reserved when linux App Service Plan                         |   |   |   |
| isXenon                            | Is Xenon App Service Plan setting                            |   |   |   |
| hyperV                             | HyperV App Service Plan setting                              |   |   |   |
| targetWorkerSizeId                 | Sets scaling worker size ID                                  |   |   |   |
| isSptargetWorkerCountot            | Sets number of Workers                                       |   |   |   |


## 3.2. Deprovisioning (GUI)
The given Azure App Service Plan is deleted.

| Parameter           | Value                                                    | Determined by |
| ------------------- | -------------------------------------------------------- | ------------- |
| FeatureName Name    | name of the FeatureName to be removed                    | Consumer      |
| Resource Group Name | name of the resource group where the FeatureName resides | Consumer      |


## 3.3. Provisioning (API)

In order to provision the Web App using the Feature APi this is the URL to use: 

http://rbalvjenkinf.bas.roche.com:8080/job/CCCFEAT/job/Azure_Appserviceplan_Api/buildWithParameters

In the following example a complete URL can be shown contianing te list of the query string  parameters to pass in the call:

http://rbalvjenkinf.bas.roche.com:8080/job/CCCFEAT/job/Azure_Appserviceplan_Api/buildWithParameters?action=delete&subscriptionId=583c4aab-2971-46f3-85d5-eddbd639befc&AppServicePlanNamee=WebAppServiceRocheIntegrationTestingFromAPiNewWithJob&appServicePlanName=AppServiceServicePlanIntegrationTesting&location=northeurope&alocation=s&environment=Production&projectName=satsha&windowsAppServicePlanTier=Standard&windowsAppServicePlanSize=1&windowsAppServicePhpVersion=5.6&windowsAppServicePlanInstances=1&perSiteScaling=false&maximumElasticWorkerCount=0&isSpot=false&reserved=false&isXenon=false&hyperV=false&targetWorkerSizeId=0&targetWorkerCount=0

This example points to the jenkins slave associated to the features branch: rbalvjenkinf


## 3.4. Deprovisioning (API)

In order to deprovision the Web App using the Feature APi this is the URL to use: 

http://rbalvjenkinf.bas.roche.com:8080/job/CCCFEAT/job/Azure_Appserviceplan_Api/buildWithParameters

In the following example a complete URL can be shown contianing the list of the query string  parameters to pass in the call:

http://rbalvjenkinf.bas.roche.com:8080/job/CCCFEAT/job/Azure_Appserviceplan_Api/buildWithParameters?action=delete&subscriptionId=583c4aab-2971-46f3-85d5-eddbd639befc&resourceGroupName=neu-s0001-rsg-gisshared-featuresnd-01&appServicePlanName=AppServiceServicePlanIntegrationTesting

The Action value would be "detele" in this case.

# 4. Service management
Service Management Framework version 1.0 is used for the following paragraphs.


## 4.1. Support and Configuration Management
Application Support is available for the following languages: Java, .NET, PHP, Python.  

Support is provided by the CCC team during business hours on a best effort basis.
- The Support Team responsible for this Feature is: **_GIS Middleware Team_**
- Submit a support request by e-mail: [global.cloud@roche.com](global.cloud@roche.com)


## 4.2. Second day activities
The requests related to Azure Windows Web App can be done through the ServiceNow CMP and are fulfilled by the Cloud Competence Center. 

| Activity         | Self-service | Description | 
| ---              | --- | --- |
| Deploy content   | yes  | Submit a request with the name of the Azure Windows Web App and the content to be added under the root folder             |
| Re-start WebSite | yes  | Consumers have enough permissions to start/stop/re-start their own websites  |
| Configure auto-scale  | no  | Only for apps that are hosted in Standard and Premium App Service Plans. The Auto Scale can be based on CPU Percentage, Memory (RAM) percentage, Disk queue Length, HTTP Queue Length, Data in, Data Out |
| Scale Up/Down  | yes  | Change the amount of instances (between 1 and 10) that will host all the Windows App Services in the App Service Plan |
| Change App Service Plan  | yes  | Consumers should have enough permissions to change their App Service Plan their own service plans (it may require downtime) |
| ... | ... | ... |

Submit requests by [Roche ServiceNow CMP](https://serviceNowCMPurl/).

Requests that are not automated are handled on a first-come, first-served basis and lead time can vary depending on team capacity and the length of the request queue.


## 4.3. Backup and disaster recovery
Azure Windows Web App provides locally-redundant storage (LRS). Hence, the data in a Azure Windows Web App account is resilient to transient hardware failures within a region through automated replicas. 
No extra backup is implemented by CCC. 

In case the application requires protection from accidental deletions, the customer could redeploy code and content, or restore from regular copies to another data store in the cloud.

*Guidance for disaster recovery can be found [here](https://docs.microsoft.com/en-us/azure/feature_name/feature-disaster-recovery-guidance)*


## 4.4. Scalability
A primary advantage of the cloud is elastic scaling — the ability to use as much capacity as you need, scaling out as load increases, and scaling in when the extra capacity is not needed.

In Windows App Service, an app runs in an App Service plan. An App Service plan defines a set of compute resources for a Windows App Service to run. These compute resources are analogous to the server farm in conventional web hosting. One or more apps can be configured to run on the same computing resources (or in the same App Service plan).
When you create an App Service plan in a certain region (for example, West Europe), a set of compute resources is created for that plan in that region. Whatever apps you put into this App Service plan run on these compute resources as defined by your App Service plan. 

Each App Service plan defines:
- Region (West US, East US, etc.)
- Number of instances (between 1-10, depending on App Service Plan Tier)
- Size of instances Small / Medium / Large
- Pricing tier (Free, Shared, Basic, Standard, Premium, Isolated, Consumption)

The sizes of each App Service Plan is detailed in: https://azure.microsoft.com/en-us/pricing/details/app-service/windows/

You can increase the capacity of an Windows App Service by one of the following two ways:
- Scale-up: Upgrade the capacity of the host where the app is hosted
- Scale-out: Upgrade the capacity of the app by increasing the number of host instances

You can do a scale-out in any of the following two ways based on the Tier of your App Service Plan:
- Manual Scale-out: You have to manually scale the apps that are based on Free, Shared and Basic App Service Plans.
- Auto Scale-out: Auto Scaling is possible only for apps that are hosted in Standard and Premium App Service Plans. The Auto Scale can be based on CPU Percentage, Memory (RAM) percentage, Disk queue Length, HTTP Queue Length, Data in, Data Out

More information on: https://docs.microsoft.com/en-us/azure/app-service/web-sites-scale


## 4.5. High Availability
For Production workloads, supporting Features and Platform Services should be backed up by an SLA, and they must be configured with High Availability when possible. 

This Service can be configured with High Availability by:
- In the Free and Shared tiers, an app receives CPU minutes on a shared VM instance and cannot scale out. 
- In other tiers, an app runs and scales as follows:
  - When you create an app in Windows App Service, it is put into an App Service plan. 
  - When the app runs, it runs on all the VM instances configured in the App Service plan. 
  - If multiple apps are in the same App Service plan, they all share the same VM instances. 
  - If you have multiple deployment slots for an app, all deployment slots also run on the same VM instances. 
  - If you enable diagnostic logs, perform backups, or run WebJobs, they also use CPU cycles and memory on these VM instances.
  - In this way, the App Service plan is the scale unit of the Windows App Service. If the plan is configured to run five VM instances, then all apps in the plan run on all five instances. 
  - If the plan is configured for autoscaling, then all apps in the plan are scaled out together based on the autoscale settings.

A minimum instance count of 2 Service Plan Instances is recommended for production workloads.

Another interesting feature for ensuring high availability during deployment is the use of **Deployment Slots**. Deploying your application to a non-production slot has the following benefits:
- You can validate app changes in a staging deployment slot before swapping it with the production slot.
- Deploying an app to a slot first and swapping it into production makes sure that all instances of the slot are warmed up before being swapped into production. This eliminates downtime when you deploy your app. The traffic redirection is seamless, and no requests are dropped because of swap operations. You can automate this entire workflow by configuring auto swap when pre-swap validation isn't needed.
- After a swap, the slot with previously staged app now has the previous production app. If the changes swapped into the production slot aren't as you expect, you can perform the same swap immediately to get your "last known good site" back.

Each App Service plan tier supports a different number of deployment slots. There's no additional charge for using deployment slots. 
 
 https://docs.microsoft.com/en-us/azure/app-service/deploy-staging-slots 


## 4.6. Pricing & efficient consumption

The pricing tier of an App Service plan determines what Windows App Service features you get and how much you pay for the plan.
https://docs.microsoft.com/en-us/azure/app-service/azure-web-sites-web-hosting-plans-in-depth-overview

Free and Shared plans provide different options to test your apps within your budget. Basic, Standard and Premium plans are for production workloads and run on dedicated Virtual Machine instances. Each instance can support multiple application and domains. The Isolated plan hosts your apps in a private, dedicated Azure environment and is ideal for apps that require secure connections with your on-premises network, or additional performance and scale. App Service plans are billed on a per second basis. Details as follows:
- The **Free and Shared** (preview) service plans are base tiers that run on the same Azure VMs as other apps. Some apps may belong to other customers. These tiers are intended to be used only for development and testing purposes. There is no SLA provided for Free and Shared service plans. Free and Shared plans are metered on a per App basis. Free only allows for 60 CPU minutes / day, 1 GB RAM and 1 GB Storage.
- The **Basic** service plan is designed for apps that have lower traffic requirements, and don't need advanced auto scale and traffic management features. Pricing is based on the size and number of instances you run. Built-in network load balancing support automatically distributes traffic across instances.
- The **Standard** service plan is designed for running production workloads. Pricing is based on the size and number of instances you run. Built-in network load balancing support automatically distributes traffic across instances. The Standard plan includes auto scale that can automatically adjust the number of virtual machine instances running to match your traffic needs.
- The **Premium** service plan is designed to provide enhanced performance for production apps. The upgraded Premium plan, Premium v2, features Dv2-series VMs with faster processors, SSD storage, and double memory-to-core ratio compared to Standard. The new Premium plan also supports higher scale via increased instance count.
- The **Isolated** service plan is designed to run mission critical workloads, that are required to run in a virtual network. The Isolated plan allows customers to run their apps in a private, dedicated environment in an Azure datacenter using Dv2-series VMs with faster processors, SSD storage, and double the memory-to-core ratio compared to Standard. The private environment used with an Isolated plan is called the App Service Environment. The plan can scale to 100 instances with more available upon request. Customers can now save 40% of the flat fee associated by purchasing 3-year Reserved Instances.

Rates are also charged for apps in stopped state. Please delete apps that are not in use or change tier to Free to avoid charges.

Full pricing information is available at: https://azure.microsoft.com/en-us/pricing/details/app-service/windows/


## 4.7. Administrative Model
Windows App Service separates authorization for account-related and data-related activities in the following manner:
- Role-based access control (RBAC) provided by Azure for account management
- The Windows App Service Owner can assign roles within the Resource Group of the Windows App Service to other Roche employees


## 4.8. Monitoring
Diagnostic logs are enabled on Azure Windows Web App to send Audit and Request logs to the central Log Analytics.
- Request logs capture every API request made on the Azure Windows Web App account.
- Audit Logs are similar to request Logs but provide a much more detailed breakdown of the operations being performed on the Azure Windows Web App account. For example, a single upload API call in request logs might result in multiple "Append" operations in the audit logs.


The Following Alerts based in Azure Monitor should be defined:

| Metric Name          | Description | Threshold |
| ---                  | ---         | ---       |
| Connectivity         | If service is down then and new Alert will be created. | N/A
| Connections Failures | Connection Failure % considering Total Connections value | “Http Server Errors” > 15/h
| Errors rates         | Number of http 404 errors considering total request |  “Http 404” > 15/h
| Packet loss          | Based on % packet loss over a period of time | packet loss /2h > 5%
| Latency              | Based on average response time | “Average Response Time” > 2 seconds
| Bandwidth            | Based on bandwidth utilization | bandwidth utilization > 95%
| Time Outs            | % of total requests | "% time outs" > 5% of total requests

By request, additional alerts could be created, such as:
- For a hundred concurrent users,define an alert for the metric “Data Out” greater than 15 MB and for the metric “Data In” greater than 500 KB

# 5. Security

This section explains the different aspects to consider in order to meet the Security Control Framework for this Standarized Service.
Security framework version 0.6.2 is used for the following paragraphs.

The security controls are met by the following roles:
- CCC: Roche Cloud Competence Center
- IAM: Roche IAM Team
- Consumer: Business unit using the feature
- Cloud Provider: Microsoft


## 5.1. Foundation controls

| FC# | What | How | Who |
| --- | ---  | --- | --- |
| | IAM on all accounts and resources | See section 5.4 Implementation of Security Controls - IAM access control on the exposed endpoints | The Consumer is responsible of configure Azure AD authentication during the deployment for this Standardized Feature |


## 5.2. Standard controls

| SC# | What | How | Who |
| --- | ---  | --- | --- |

## 5.3. Complementary advanced controls

| CLM# | What | How | Who |
| --- | --- | --- | --- |
| | Data integrity and confidentiality | Azure Windows Web App is delivered as AIC 2-2-2 feature. If the consumer decides to store C/I=3 data like PCI/DSS (Payment Card Industry/ Data Security Standard) data, the consumer needs to implement extra security controls. Please refer to the Security Team security baseline and standards for additional controls. | Customer
| | Sub folders and permissions | Once the Azure Windows Web App is delivered, the consumer has owner rights on his data folder so that he/she can create sub folders and assign permissions on these folders. | Customer


## 5.4. Implementation of Security Protocols

### 5.4.1 IAM access control on the exposed endpoints

| EndPoint | How to Configure IAM | Deployment Parameters |
| --- | --- | --- |


