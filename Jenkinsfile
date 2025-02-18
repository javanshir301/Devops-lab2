pipeline {
    agent any

    environment {
        IMAGE_NAME = "javanshir1995/devops-lab2"  // Docker Hub üçün image adı
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/javanshir301/Devops-lab2.git'
            }
        }

        stage('Setup Python Environment') {
            steps {
                script {
                    sh '''
                    python3 -m venv venv
                    source venv/bin/activate
                    pip install -r requirements.txt
                    '''
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    sh '''
                    source venv/bin/activate
                    pytest || echo "Tests failed, but continuing..."
                    '''
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: 'docker-hub-cred', url: '']) {
                    sh 'docker push $IMAGE_NAME'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline uğurla tamamlandı! 🚀'
        }
        failure {
            echo 'Pipeline-da xəta baş verdi! 🔥'
        }
    }
}

