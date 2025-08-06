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

        stage('Verify tooling'){
            steps{
                sh """ docker -H ${DOCKER_HOST} info """
                sh """ docker -H ${DOCKER_HOST} version """
                sh """ docker -H ${DOCKER_HOST} compose version"""
            }
        }


        stage('Run flyway migrations'){
            steps{
                sh '''ls -l'''
                sleep time: 60 , unit: 'SECONDS'
                // sh """ docker -H ${DOCKER_HOST} compose -f docker-compose.yaml up -d"""
            }
        }

    }
}