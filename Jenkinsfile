#!groovy

pipeline {
  agent {
    docker {
      image 'mhhoban/pythonbuild:cit'
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
      }
    }
    stage('Test New Build') {
      steps {
        sh './run_component_tests.sh'
      }
    }
    stage('Tag New Build') {
      steps {
        sh 'docker tag mhhoban/dukedoms_mock_card_service:candidate mhhoban/dukedoms_mock_card_service:$GIT_COMMIT'
        sh 'docker tag mhhoban/dukedoms_mock_card_service:candidate mhhoban/dukedoms_mock_card_service:latest'
      }
    }
    stage('Publish Image to DockerHub') {
      steps {
      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'dockerhub-auth',
                    usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
        sh 'docker login -u $USERNAME -p $PASSWORD'
        sh 'docker push mhhoban/dukedoms_mock_card_service:latest'
        sh 'docker push mhhoban/dukedoms_mock_card_service:$GIT_COMMIT'

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
