pipeline {
    agent any

    environment {
        ENV_FILE = credentials('env-docker-file-id')
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master',
                    url: 'https://github.com/Pratikisback/chat_be_cicd.git'
            }
        }

        stage('Build & Deploy') {
            steps {
                sh 'cp $ENV_FILE .env.docker'
                sh 'docker compose up --build -d'
            }
        }
    }
}
