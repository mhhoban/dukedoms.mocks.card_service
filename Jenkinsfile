#!groovy

pipeline {
  agent {
    docker {
      image 'mhhoban/pythonbuild:cti'
      args '-v /var/run/docker.sock:/var/run/docker.sock:rw'
    }
  }
  stages {
    stage('Get Source') {
      steps {
        checkout scm
      }
    }
    stage('Build Docker Image') {
      steps {
        sh './build_docker_image.sh'
        sh 'docker tag mhhoban/dukedoms_mock_card_service:latest mhhoban/dukedoms_mock_card_service:$GIT_COMMIT'
      }
    }
    stage('Test New Build') {
      steps {
        sh './run_component_tests.sh'
      }
    }
    stage('Publish Image to DockerHub') {
      steps {
      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub-auth',
                    usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
        sh 'docker login -u $USERNAME -p $PASSWORD && docker push mhhoban/dukedoms_mock_card_service:latest && docker push mhhoban/dukedoms_mock_card_service:$GIT_COMMIT'

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
