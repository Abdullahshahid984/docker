pipeline {
    agent any

    environment {
        IMAGE_NAME = "jenkins"
        PDF_FILE = "output.pdf"  // Change this based on your script's output filename
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
                    sh "docker run --rm -v $WORKSPACE:/app ${IMAGE_NAME}"
                }
            }
        }
    }

    post {
        success {
            script {
                def pdfPath = "${WORKSPACE}/${PDF_FILE}"
                if (fileExists(pdfPath)) {
                    emailext subject: '✅ Jenkins Pipeline Success',
                             body: 'The pipeline executed successfully. Please find the attached PDF file.',
                             to: 'abdullahshahid984@gmail.com',
                             from: 'abdullahshahid984@gmail.com',
                             attachmentsPattern: "**/${PDF_FILE}"
                } else {
                    echo "⚠️ PDF file not found: ${pdfPath}"
                }
            }
        }
    }
}
