pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/Pratikisback/chat_be_cicd.git'
            }
        }

        stage('Build & Deploy') {
            steps {
                sh 'docker ps -q | xargs -r docker stop'
                sh 'docker compose up --build -d'
            }
        }

    }
}