/**
* Pipeline to launch ICM MT infrastructure 
**/

pipeline {

  agent {
    libraries {
      lib('github.com/rakeshzingade/jenkinstest@master')
    }
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
