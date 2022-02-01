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
        sh 'testing the pod with k8s'
      }
    }
  }
}
