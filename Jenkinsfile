pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-python-app"
        CONTAINER_NAME = "python-converter"
        OUTPUT_PDF = "output.pdf"
        SMTP_SERVER = "smtp.gmail.com" // Update with your SMTP server
        RECIPIENT_EMAIL = "abdullahshahid984@gmail.com" // Update with recipient email
        SENDER_EMAIL = "abdullahshahid984@gmail.com" // Update with sender email
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Abdullahshahid984/docker.git' // Replace with your actual repository
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }

        stage('Run Container') {
            steps {
                script {
                    sh "docker run --rm --name ${CONTAINER_NAME} ${IMAGE_NAME}"
                }
            }
        }

        stage('Send Email with PDF') {
            steps {
                script {
                    sh "echo 'PDF conversion completed. Find the attached PDF.' | mail -s 'Converted PDF' -a ${OUTPUT_PDF} -r ${SENDER_EMAIL} ${RECIPIENT_EMAIL}"
                }
            }
        }
    }
}
