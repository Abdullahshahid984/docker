pipeline {
    agent any

    environment {
        IMAGE_NAME = "jenkins"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/Abdullahshahid984/docker.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh "docker run --rm ${IMAGE_NAME}"
                }
            }
        }
    }

    post {
        success {
            emailext subject: '✅ Jenkins Pipeline Success', 
                     body: 'The pipeline executed successfully.', 
                     to: 'your-email@example.com', 
                     from: 'jenkins@example.com'
        }
        failure {
            emailext subject: '❌ Jenkins Pipeline Failure', 
                     body: 'The pipeline failed. Please check the logs.', 
                     to: 'your-email@example.com', 
                     from: 'jenkins@example.com'
        }
    }
}
