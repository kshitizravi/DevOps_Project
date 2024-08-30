pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
        DEV_IMAGE = "${DOCKERHUB_USERNAME}/dev:latest"
        PROD_IMAGE = "${DOCKERHUB_USERNAME}/prod:latest"
    }

    stages {
        stage('Build') {
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'
                echo "The current branch is ${env.BRANCH_NAME}"
                sh 'printenv'
            }
        }

        stage('Push to Dev') {
            when {
                branch 'dev'
            }
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com', 'dockerhub-credentials') {
                        docker.image(DEV_IMAGE).push()
                    }
                }
            }
        }

        stage('Push to Prod') {
            when {
                branch 'master'
            }
            steps {
                script {
                    docker.withRegistry('https://hub.docker.com', 'dockerhub-credentials') {
                        docker.image(PROD_IMAGE).push()
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
