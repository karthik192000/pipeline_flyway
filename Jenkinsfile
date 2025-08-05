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
                git credentialsId: "${GITHUB_CREDS}",branch : "master", url: 'https://github.com/karthik192000/flyway-demo.git'
            }
        
        }

        stage('Maven Build'){
            steps {
                script{
                    env.PROJECT_NAME = sh(script: 'grep -oPm1 "(?<=<artifactId>)[^<]+" pom.xml', returnStdout: true).trim()
                    env.VERSION = sh(script: ' grep -oPm1 "(?<=<version>)[^<]+" pom.xml', returnStdout: true).trim()
                    sh '''
                         mvn clean install
                    
                       '''
                }
            }
        }
    }
}