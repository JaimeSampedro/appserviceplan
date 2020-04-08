//Loading dynamically the library.
def shared; // has to be global to be used in the pipeline
def RGName;
def actionGroupRGName;
node{
    dir('shared') {       
        def branch = usage
        if (usage != 'develop' && usage != 'master'){
            branch = "features"
        }
        git credentialsId: 'jenkinsbituserssh', branch: "${branch}", url: 'ssh://git@bitbk.roche.com:7999/cccfeat/ansible-role-azure_common.git'                                                             
        shared = load 'sharedfunctionsgroovy/PipelineFunctions.groovy'
    }
}

pipeline {
agent {label 'CCC-WORKER'}
parameters {
   string(name: 'action', description: 'Action to perform to the feature') 
    string(name: 'subscriptionId', description: 'Id of the subscription')  
    string(name: 'appServicePlanName', description: 'App Service Plan name for the web app') 
    string(name: 'location', description: 'Location to use for provision')
    string(name: 'allocation', description: 'Identifies if it is business or Shared')   
    string(name: 'environment', description: 'Environment Prod or Non-Prod')   
    string(name: 'projectName', description: 'Project Name associated') 
    string(name: 'windowsAppServicePlanTier', description: 'Tier for the app service')
    string(name: 'windowsAppServicePlanSize', description: 'Plan size for the app servicen')
    string(name: 'windowsAppServicePlanInstances', description: 'The amount of instances that will run the App Services in the App Service Plan')
    string(name: 'perSiteScaling', description: 'nable per-app scaling at the App Service plan level to allow for scaling an app independently from the App Service plan that hosts it')
    string(name: 'maximumElasticWorkerCount', description: 'maximum number of total workers allowed for this ElasticScaleEnabled App Service Plan')
    string(name: 'isSpot', description: 'this App Service Plan owns spot instances.')
    string(name: 'reserved', description: 'Reserved when linux App Service Plan.')
    string(name: 'isXenon', description: 'Is Xenon App Service Plan setting.',  defaultValue: 'false')
    string(name: 'hyperV', description: 'HyperV App Service Plan',  defaultValue: 'false')
    string(name: 'targetWorkerSizeId', description: 'Sets scaling worker size ID',  defaultValue: 'false')
    string(name: 'targetWorkerCount', description: 'Sets number of Workers',  defaultValue: 'false')
  }

	stages {
          stage ('Downloading  required roles for creating Web App') {
             steps {
                sh '''sed -i "s,(branch),$GIT_BRANCH,g" requirements.yml'''
                sh 'ansible-galaxy install -f -p ./roles -r requirements.yml'
              }
             post {
               failure {
                 print "Error installing the role "
               }
             }
        }     	
        stage ('Runs APi action') {
            steps {
                  script{                
                    RGName = shared.getResourceGroupName(location, allocation, projectName, environment)    
                    actionGroupRGName = shared.getActionGroupRG(RGName)                                                                                           
                  }
                  withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId:'AzureID', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
                    withCredentials([string(credentialsId: 'AzureTenantID', variable: 'AZURETENANTID')]) {
                    ansiblePlaybook(
                      playbook: 'playbook.yml',
                      installation:'AnsibleP3',
                      extras:'-vvv',
                      extraVars: [
                         azure_appserviceplan_subscriptionId: params.subscriptionId,
                        azure_appserviceplan_resourceGroupName: RGName,     
                        azure_appserviceplan_action: params.action,                                      
                        azure_appserviceplan_appServicePlanName: params.appServicePlanName,
                        azure_appserviceplan_location: params.location,
                        azure_appserviceplan_windowsAppServicePlanTier: params.windowsAppServicePlanTier,
                        azure_appserviceplan_windowsAppServicePlanSize: params.windowsAppServicePlanSize,
                        azure_appserviceplan_windowsAppServicePlanInstances: params.windowsAppServicePlanInstances,
                        azure_appserviceplan_perSiteScaling: params.perSiteScaling,
                        azure_appserviceplan_maximumElasticWorkerCount: params.maximumElasticWorkerCount,
                        azure_appserviceplan_isSpot: params.isSpot,
                        azure_appserviceplan_reserved: params.reserved,
                        azure_appserviceplan_isXenon: params.isXenon,
                        azure_appserviceplan_hyperV: params.hyperV,
                        azure_appserviceplan_targetWorkerSizeId: params.targetWorkerSizeId,
                        azure_appserviceplan_targetWorkerCount: params.targetWorkerCount,
                        azure_appserviceplan_rgName_actionGroup: actionGroupRGName,
                        azure_appserviceplan_client_id: env.USERNAME, 
                        azure_appserviceplan_secret: env.PASSWORD,
                        azure_appserviceplan_tenant: env.AzureTenantID 
                      ]
                      )
                    }
              }
            }
            post {
                always {
                    sleep 5
                }
            }            
      }
     
    }
}
