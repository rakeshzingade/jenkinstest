/**
* Pipeline to launch ICM MT infrastructure 
**/

pipeline {

  agent {
    kubernetes {
      yamlFile 'resources/agentPodTemplate.yaml'
    }
  }
  stages {
    stage('test') {
      steps {
        sh '''
           echo "testing the base pod for required softwares"
           sleep 600
           terragrunt --version
           terraform --version
           az version
        '''
      }
    }
  }
}
