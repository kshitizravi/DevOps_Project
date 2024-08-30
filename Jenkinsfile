pipeline {
    agent any

    environment {
        DEV_REPO = 'ravikshitiz/dev'
        PROD_REPO = 'ravikshitiz/prod'
        DOCKER_CREDENTIALS_ID = 'dockerhub-credentials'
    }

    stages {
        stage('Build and Push to Dev') {
            when {
                branch 'origin/dev'
            }
            steps {
                script{
                    def imageName = "${DEV_REPO}:latest"
                    sh 'chmod +x build.sh'
                    sh "./build.sh"
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"
                        sh "docker push ${imageName}"
                    }
                } 
            }
        }
    
        stage('Push to Prod') {
            when {
                branch 'master'
                changeset "dev"
            }
            steps {
                script {
                    sh 'docker build -t react-app-prod:latest .'
                    sh 'docker tag react-app-prod:latest ravikshitiz/dev:latest'
                    def imageName = "${PROD_REPO}:latest"
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"
                        sh "docker push ${imageName}"
                    }
                }
            }
        }
    
        stage('Deploy') {
            steps {
                sh 'chmod +x deploy.sh'
                sh './deploy.sh'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
