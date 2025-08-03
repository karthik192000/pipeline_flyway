pipeline {

    agent{
        label 'docker_jenkins_agent'
    }
    stages{
        stage('Git Checkout'){
            steps{
                git credentialsId: "${GITHUB_CREDS}",branch : "master", url: 'https://github.com/karthik192000/flyway_docker.git'
            }
        }
    }
}