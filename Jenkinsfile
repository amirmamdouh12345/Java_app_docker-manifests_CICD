pipeline {
    agent any

    stages {
        stage('git clone') {
            steps {
            git 'https://github.com/amirmamdouh12345/Java_app_docker-manifests_CICD.git'   
            }
        }
        stage('test and build app') {
            steps {
                dir('web-app'){
                  sh './gradlew test'
                  sh './gradlew build'
                }
            }
        }

        stage('docker build and push to dockerhub') {
            steps {
               sh 'docker build -t amirmamdouh123/ivolve_project .'

                withCredentials([usernamePassword(credentialsId:'docker-cred',usernameVariable:'USERNAME',passwordVariable:'PASSWORD' )]){
                    sh'''
                    docker login -u $USERNAME -p $PASSWORD
                    docker push amirmamdouh123/ivolve_project
                    '''
                }
            }
            
        }

    }
}

