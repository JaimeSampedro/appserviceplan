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
    string(name: 'action', description: 'Action to perform to the feature', defaultValue: 'create') 
    string(name: 'subscriptionId', description: 'Id of the subscription', defaultValue: 'c8bb7d78-6640-49de-a8a1-f00efab57c19')  
    string(name: 'appServicePlanName', description: 'App Service Plan name for the web app',  defaultValue: 'appservrocheci') 
    string(name: 'location', description: 'Location to use for provision',  defaultValue: 'westeurope')
    string(name: 'allocation', description: 'Identifies if it is business or Shared',  defaultValue: 's')   
    string(name: 'environment', description: 'Environment Prod or Non-Prod',  defaultValue: 'Production')   
    string(name: 'projectName', description: 'Project Name associated',  defaultValue: 'satsha') 
    string(name: 'windowsAppServicePlanTier', description: 'Tier for the app service',  defaultValue: 'Standard')
    string(name: 'windowsAppServicePlanSize', description: 'Plan size for the app servicen',  defaultValue: '1')
    string(name: 'windowsAppServicePlanInstances', description: 'The amount of instances that will run the App Services in the App Service Plan',  defaultValue: '1')
    string(name: 'perSiteScaling', description: 'Per-app scaling at the App Service plan level to allow for scaling an app independently from the App Service plan that hosts it',  defaultValue: 'false')
    string(name: 'maximumElasticWorkerCount', description: 'Maximum number of total workers allowed for this ElasticScaleEnabled App Service Plan',  defaultValue: '0')
    string(name: 'isSpot', description: 'This App Service Plan owns spot instances.',  defaultValue: 'false')
    string(name: 'reserved', description: 'Reserved when linux App Service Plan.',  defaultValue: 'false')
    string(name: 'isXenon', description: 'Is Xenon App Service Plan setting.',  defaultValue: 'false')
    string(name: 'hyperV', description: 'HyperV App Service Plan',  defaultValue: 'false')
    string(name: 'targetWorkerSizeId', description: 'Sets scaling worker size ID',  defaultValue: '0')
    string(name: 'targetWorkerCount', description: 'Sets number of Workers',  defaultValue: '0')   
  }            
  stages {
     stage ('Downloading required roles for creating the Web App role ') {
          steps {
              sh '''sed -i "s,(branch),$GIT_BRANCH,g" requirements.yml'''
              sh 'ansible-galaxy install -f -p ./roles -r requirements.yml'               
          }
          post {
              failure {
              print "Error installing role "
              }
          }
     }
     stage ('Runs APi action ') {
            steps {
                  script{                
                    RGName = shared.getResourceGroupName(params.location, params.allocation, params.projectName, params.environment)    
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
      stage('Test Azure Standardized Service') {
          steps {
              withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId:'AzureID', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
                 withCredentials([string(credentialsId: 'AzureTenantID', variable: 'AZURETENANTID')]) {                
                  sh 'pwsh -command "tests/CleanUpFiles.ps1"; mkdir tests/generatedfiles'                                       
                  sh "pwsh -command \"tests/GetFeatureData.ps1 ${subscriptionId} ${RGName} ${appServicePlanName}; cat tests/generatedfiles/appserviceplan.json\""    
                  sh 'echo appserviceplanFilePath : ${WORKSPACE}/tests/generatedfiles/appserviceplan.json > tests/generatedfiles/attributes.yml'                            
                  sh 'cat tests/generatedfiles/attributes.yml'    
                  sh 'inspec exec tests/inspectest.rb --input-file tests/generatedfiles/attributes.yml --chef-license accept-silent --reporter cli json:$WORKSPACE/tests/generatedfiles/stdout.json'                                                 
                 }
              }              
          }
          post {
            
              always {
                sleep 5
              }
           }
          }       
        stage ('Clean Up resources created for testing in Cloud') {
            steps {
               withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId:'AzureID', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
                 withCredentials([string(credentialsId: 'AzureTenantID', variable: 'AZURETENANTID')]) {                
                    ansiblePlaybook(
                      playbook: 'playbook.yml',
                      installation:'AnsibleP3',
                      extras:'-vvv',
                      extraVars: [  
                        azure_appserviceplan_subscriptionId: params.subscriptionId,
                        azure_appserviceplan_resourceGroupName: RGName,  
                        azure_appserviceplan_action: 'delete',                                                   
                        azure_appserviceplan_appServicePlanName: params.appServicePlanName,
                        azure_appserviceplan_location: params.location,
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