pipeline {

    agent{
        label 'docker_jenkins_agent'
    }
    environment {
        GITHUB_CREDS = 'GITHUB_PAT'
    }
    stages{
        stage('Git Checkout'){
            steps{
                git credentialsId: "${GITHUB_CREDS}",branch : "master", url: 'https://github.com/karthik192000/flyway_docker.git'
            }
        
        }

        stage('Pull Flyway Docker Image'){
            steps{
                script{
                    sh "docker -H ${DOCKER_HOST} pull flyway/flyway:latest"
                }
            }
        }

        stage('Run Flyway Migrations for products schema'){
            steps{
                script{
                    sh 'cd flyway/sql/products'
                    sh "docker-compose ${DOCKER_HOST} up"
                    echo "Flyway migrations for products schema completed successfully."
                    sh "docker-compose -H ${DOCKER_HOST} down"
                }
            }
        }
    }
}