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
                script {
                    // Set the workspace environment variable
                    env.WORKSPACE = pwd()
                    sh '''ls -l'''
                    sh '''cat conf/flyway.conf'''
                    sh """ 
                        docker run --rm \
                        -v flyway-volume:/target \
                        -v $(pwd):/source \
                        alpine \
                        sh -c 'cp -r /source/conf/ target/ && cp -r /source/sql/ target/ && ls -l target/'
                     """
                    // sh """ docker -H ${DOCKER_HOST} compose -f docker-compose.yaml up -d"""                    
                    
                }
            }
        }

    }

        // post{
        //     always
        //     {
        //         sh """ docker -H ${DOCKER_HOST} compose -f docker-compose.yaml down"""
        //     }
        // }    
}