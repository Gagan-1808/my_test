pipeline {
    agent { label 'prod' }

    triggers {
        githubPush()
    }

    stages {

         stage('Apply config and secrets') {
            steps {
                dir('k8') {
                    sh '''
                    kubectl apply -f secrets.yml
                    kubectl apply -f configmap-auth.yml
                    kubeclt apply -f configmap-todo.yml
                    '''
                }
            }
        }

        stage('Deploy Auth Service') {
            steps {
                dir('k8') {
                    sh '''
                        kubectl apply -f deployment-auth.yml
                        kubectl apply -f service-auth.yml
                        kubectl rollout status deployment/auth-deployment --timeout=120s
                    '''
                }
            }
        }

        stage('Deploy Todo Service') {
            steps {
                 script {
                    sh '''
                        kubectl apply -f deployment-todo.yml
                        kubectl apply -f service-todo.yml
                        kubectl rollout status deployment/todo-deployment --timeout=120s
                    '''
                }
            }
        }

        stage('Deploy Frontend Service') {
            steps {
                dir('k8') {
                    sh '''
                        kubectl apply -f deployment-frontend.yml
                        kubectl apply -f service-frontend.yml
                        kubectl rollout status deployment/frontend-deployment --timeout=120s
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "✅ Deployment Successful"
        }
        failure {
            echo "❌ Deployment Failed"
        }
    }
}
