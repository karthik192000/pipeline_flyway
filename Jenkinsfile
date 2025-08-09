pipeline {

    agent{
        label 'docker_jenkins_agent'
    }
    environment {
        GITHUB_CREDS = 'GITHUB_PAT'
        FLYWAY_DB_URL = credentials('FLYWAY_DB_URL')
        FLYWAY_DB_USERNAME = credentials('FLYWAY_DB_USERNAME')
        FLYWAY_DB_PASSWORD = credentials('FLYWAY_DB_PASSWORD')
    }
    stages{
        stage('Git Checkout'){
            steps{
                git credentialsId: "${GITHUB_CREDS}",branch : "master", url: 'https://github.com/karthik192000/flyway_docker.git'
            }
        
        }

        // stage('Export Flyway Credentials to env file'){
        //     steps{
        //         script {
        //             // Create the env file with Flyway credentials
        //             sh """
        //             echo "FLYWAY_DB_URL=${FLYWAY_DB_URL}" > flyway.env
        //             echo "FLYWAY_DB_USERNAME=${FLYWAY_DB_USERNAME}" >> flyway.env
        //             echo "FLYWAY_DB_PASSWORD=${FLYWAY_DB_PASSWORD}" >> flyway.env
        //             """
        //         }
        //     }
        // }

        stage('Verify tooling'){
            steps{
                sh """ docker -H ${DOCKER_HOST} info """
                sh """ docker -H ${DOCKER_HOST} version """
                sh """ docker -H ${DOCKER_HOST} compose version"""
            }
        }


        stage('Run flyway migrations'){
            steps{
                script {
                    // Set the workspace environment variable
                    sh """
                     export FLYWAY_WORKDIR=${JOB_NAME}
                     export FLYWAY_DB_URL=${FLYWAY_DB_URL}
                     export FLYWAY_DB_USERNAME=${FLYWAY_DB_USERNAME}   
                     export FLYWAY_DB_PASSWORD=${FLYWAY_DB_PASSWORD}

                     docker -H ${DOCKER_HOST} compose -f docker-compose.yaml up -d"""                    
                    
                }
            }
        }

       } 
post{
    always {
        script {
            // Clean up the workspace
            sh "docker -H ${DOCKER_HOST} compose -f docker-compose.yaml down"
        }
    }
} 
    }

 
  