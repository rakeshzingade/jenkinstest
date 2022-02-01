/**
* Pipeline to launch ICM MT infrastructure 
**/

pipeline {

  libraries {
    lib('github.com/rakeshzingade/jenkinstest@master')
  }
  agent {
    kubernetes {
      defaultContainer 'terragrunt-azure'
      yaml libraryResource('resources/agentPodTemplate.yaml')
    }
  }
  stages {
    stage('test') {
      steps {
        sh 'testing the pod with k8s'
      }
    }
  }
}
