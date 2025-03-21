pipeline {
    agent any
    environment {
        OUTPUT_PDF = "\"/var/lib/jenkins/workspace/word to pdf/output/output.pdf\""
        RECIPIENT_EMAIL = "abdullahshahid984@gmail.com"
    }
    stages {
        stage('Clone Repository') {
            steps {
                git url: 'https://github.com/Abdullahshahid984/docker.git', branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-python-app:latest .'
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker run --rm --name python-converter -v "/var/lib/jenkins/workspace/word to pdf/output:/app/output" my-python-app:latest'
            }
        }
       stage('Send Email with PDF') {
    steps {
        script {
            def outputPdf = "\"/var/lib/jenkins/workspace/word to pdf/output/output.pdf\""

            // Using mail command with a properly formatted attachment path
            def emailCommand = """
            echo "PDF conversion completed. Find the attached PDF." | mail -s "Converted PDF" -a ${outputPdf} -r ${RECIPIENT_EMAIL} ${RECIPIENT_EMAIL}
            """

            def emailStatus = sh(script: emailCommand, returnStatus: true)

            if (emailStatus != 0) {
                echo "⚠️ Mail command failed, trying mutt..."
                sh """
                echo "PDF conversion completed. Find the attached PDF." | mutt -s "Converted PDF" -a ${outputPdf} -- ${RECIPIENT_EMAIL}
                """
            }
        }
    }
}

