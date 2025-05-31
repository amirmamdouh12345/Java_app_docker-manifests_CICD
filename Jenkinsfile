pipeline {
    agent any

    stages {
        stage('git clone') {
            steps {
                sh 'mkdir -p ./application' 
                dir('application'){
                git 'https://github.com/amirmamdouh12345/Java_app_docker-manifests_CICD.git'   
                }
            }
        }
        
        
        stage('test and build app') {
            steps {
                dir('application/web-app'){
                  sh './gradlew test'
                  sh './gradlew build'
                }
            }
        }


        stage('docker build and push to dockerhub') {
            steps {
                
               sh 'docker build -t amirmamdouh123/ivolve_project ./application'

                withCredentials([usernamePassword(credentialsId:'docker-cred',usernameVariable:'USERNAME',passwordVariable:'PASSWORD' )]){
                    sh'''
                    docker login -u $USERNAME -p $PASSWORD
                    docker push amirmamdouh123/ivolve_project
                    '''
                }
            }
            
        }
        
        
        stage('push updates to ') {
            steps {
                
                sh 'mkdir -p ./argocd'
                
                dir('argocd'){
                git 'https://github.com/amirmamdouh12345/Java_app_docker-manifests_CICD_argoCD.git'   
                
                
                sh 'git config --global user.name "amirmamdouh12345"'
                sh 'git config --global user.email "amir.mam.alx@gmail.com"'
                script {
                    try {
                    
                        sh 'cp -r ../application/manifests .'
                        sh 'git add ./manifests'
                        sh 'git commit -m "upload kubernetes updates"'
                        
                        sh 'git config --global credential.helper store'
                        
                        withCredentials([string(credentialsId:'github_token',variable:'GITHUB_TOKEN')]){
                            
                            sh 'echo "https://amirmamdouh12345:$GITHUB_TOKEN@github.com" > ~/.git-credentials'
                            sh 'git push origin master'
                            
                        }
                        
                        echo 'Manifests\'ve just been updated in repo'
    
                    }
                    catch(exp){
                        echo 'No Updates in maniftests'
                    }
                }
                
            }
                
            }
        }
        
        

    }
}
