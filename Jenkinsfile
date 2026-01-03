pipeline {
    agent { label 'prod' }

    triggers {
        githubPush()
        }
    stages {
        
        stage('Deploy Auth and service to K8 cluster') {
           steps {
                script {
                    echo "Deploying..."
                    sh """
                        kubectl apply -f deployment-auth.yml
                        kubectl apply -f service-auth.yml
                    """
                }
            }
        }

        stage('Test Deployment') {
            steps {
                script {
                    echo "test deployment.."
                    sh """
                        sleep 10
                        kubectl rollout status deployment/auth-deployment --timeout=120s
                        kubectl wait --for=condition=Ready pod -l app=pdd --timeout=120s
                    """
                }
            }
        }
    }
   stages {
        
        stage('Deploy Todo and service to K8 cluster') {
           steps {
                script {
                    echo "Deploying..."
                    sh """
                        kubectl apply -f deployment-todo.yml
                        kubectl apply -f service-todo.yml
                    """
                }
            }
        }

        stage('Test Deployment') {
            steps {
                script {
                    echo "test deployment.."
                    sh """
                        sleep 10
                        kubectl rollout status deployment/todo-deployment --timeout=120s
                        kubectl wait --for=condition=Ready pod -l app=pdd --timeout=120s
                    """
                 }
             }
         }
    }
 stages {
        
        stage('Deploy frontend and service to K8 cluster') {
           steps {
                script {
                    echo "Deploying..."
                    sh """
                        kubectl apply -f deployment-frontend.yml
                        kubectl apply -f service-frontend.yml
                    """
                }
            }
        }

        stage('Test Deployment') {
            steps {
                script {
                    echo "test deployment.."
                    sh """
                        sleep 10
                        kubectl rollout status deployment/frontend-deployment --timeout=120s
                        kubectl wait --for=condition=Ready pod -l app=pdd --timeout=120s
                    """
                 }
             }
         }
    }

  
        
    post {
        success {
            echo "Deployment Successfull"
        }
        failure {
            echo "Deployment failed"
        }
    }
}
        
