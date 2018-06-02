#!groovy

pipeline {
  agent {
    docker {
      image 'mhhoban/pythonbuild'
      args '-v /var/run/docker.sock:/var/run/docker.sock:rw'
    }
  }
  stages {
    stage('Get Source') {
      steps {
        checkout scm
      }
    }
    stage('Build sdist') {
      steps {
        sh 'python setup.py sdist'
      }
    }
    stage('Build Docker Image') {
      steps {
        sh './build_docker_image'
        sh 'docker tag mhhoban/dukedoms_mock_card_service:latest mhhoban/dukedoms_mock_card_service:$GIT_COMMIT '
      }
    }
    stage('Publish Image to DockerHub') {
      steps {
      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub-auth',
                    usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
        sh 'docker login -u $USERNAME -p $PASSWORD && docker push mhhoban/dukedoms_mock_card_service:jenkins-build'

      }
    }
  }
  }
  post {
    always {
      cleanWs()
    }
  }

}
