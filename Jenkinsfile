#!groovy

pipeline {
  agent none
  stages {
    stage('Get Source') {
      steps {
        checkout scm
      }
    }
    stage('wtf is here:')
      steps {
        sh 'ls'
      }
  }
  post {
    always {
      cleanWs()
    }
  }

}
