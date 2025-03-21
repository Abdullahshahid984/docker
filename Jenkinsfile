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
                     to: 'abdullahshahid984@gmail.com', 
                     from: 'abdullahshahid984@gmail.com'
        }
    }
}
