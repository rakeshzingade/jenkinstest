/**
* Pipeline to launch ICM MT infrastructure 
**/

pipeline {

  agent {
    kubernetes {
      defaultContainer 'terragrunt-azure'
      yamlFile 'resources/agentPodTemplate.yaml'
    }
  }
  stages {

    /** test for available packages **/
    stage('test') {
      steps {
        sh '''
           echo "testing the base pod for required softwares"
           terragrunt --version
           terraform --version
           az version
        '''
      }
    }

    /** infra initialization stage **/
    stage('terragrunt init') {
      steps {
        ansiColor('xterm') {
          withCredentials([azureServicePrincipal(
            credentialsId: 'cloudops_svc_id',
            subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
            clientIdVariable: 'ARM_CLIENT_ID',
            clientSecretVariable: 'ARM_CLIENT_SECRET',
            tenantIdVariable: 'ARM_TENANT_ID'
          ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')]) {
            sh '''
              echo "Initialising terragrunt"
              cd tfcode
              terragrunt init -backend-config="access_key=$ARM_ACCESS_KEY"
              cd -
            '''  
          }
        }
      }
    }

    /** infra creation stage **/
    stage('terragrunt apply') {
      steps {
        ansiColor('xterm') {
          withCredentials([azureServicePrincipal(
            credentialsId: 'cloudops_svc_id',
            subscriptionIdVariable: 'ARM_SUBSCRIPTION_ID',
            clientIdVariable: 'ARM_CLIENT_ID',
            clientSecretVariable: 'ARM_CLIENT_SECRET',
            tenantIdVariable: 'ARM_TENANT_ID'
          ), string(credentialsId: 'access_key', variable: 'ARM_ACCESS_KEY')]) {
            sh '''
              echo "Apply terragrunt"
              cd tfcode
              terragrunt apply -auto-approve \
                    -var "client_id=$ARM_CLIENT_ID" \
                    -var "client_secret=$ARM_CLIENT_SECRET" \
                    -var "subscription_id=$ARM_SUBSCRIPTION_ID" \
                    -var "tenant_id=$ARM_TENANT_ID" \
                    -var "location=eastus" \
                    -var "rgname=jenkinpstryoutrg"
              cd -
            '''  
          }
        }
      }
    }
  }
}
