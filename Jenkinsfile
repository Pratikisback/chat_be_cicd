pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/Pratikisback/chat_be_cicd.git'
            }
        }

        stage('Inject Env File') {
            steps {
                withCredentials([file(credentialsId: '511090a8-01d2-4ec1-bfa9-acba9d753868', variable: 'ENV_FILE')]) {
                    sh 'cp $ENV_FILE .env.docker'
                }
            }
        }

        stage('Build & Deploy') {
            steps {
                sh 'docker compose up --build -d'
            }
        }
    }
}
