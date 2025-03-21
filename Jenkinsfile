pipeline {
    agent any

    environment {
        IMAGE_NAME = "word-to-pdf"
        CONTAINER_NAME = "word-to-pdf-container"
        WORKSPACE_DIR = "${WORKSPACE}"
        PDF_FILE = "converted.pdf"
        EMAIL_TO = "recipient@example.com"
        EMAIL_SUBJECT = "Converted PDF File"
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
                    sh 'docker build -t ${IMAGE_NAME} .'  // Make sure IMAGE_NAME is correct
                }
            }
        }

        stage('Run Docker Container and Convert PDF') {
            steps {
                script {
                    sh 'docker run --rm -v ${WORKSPACE_DIR}:/app ${IMAGE_NAME}'  // Use correct image name
                }
            }
        }

        stage('Send Email with PDF') {
            steps {
                script {
                    emailext (
                        to: "${EMAIL_TO}",
                        subject: "${EMAIL_SUBJECT}",
                        body: "The converted PDF is attached.",
                        attachFiles: "${WORKSPACE_DIR}/${PDF_FILE}"
                    )
                }
            }
        }
    }
}
