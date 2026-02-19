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
                sh 'sudo docker compose down'
                sh 'sudo docker compose up --build -d'
            }
        }

    }
}
