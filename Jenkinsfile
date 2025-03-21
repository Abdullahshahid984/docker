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
                    sh "docker run --rm -v ${WORKSPACE}:/output ${IMAGE_NAME}"
                }
            }
        }
    }

    post {
        success {
            script {
                def pdfFiles = findFiles(glob: '**/*.pdf') // Find all PDFs in the workspace
                if (pdfFiles.length > 0) {
                    emailext subject: '✅ Jenkins Pipeline Success',
                             body: 'The pipeline executed successfully. Please find the attached PDF files.',
                             to: 'abdullahshahid984@gmail.com',
                             from: 'abdullahshahid984@gmail.com',
                             attachmentsPattern: '**/*.pdf' // Attach all PDFs dynamically
                } else {
                    echo "⚠️ No PDF files found in the workspace."
                }
            }
        }
    }
}
