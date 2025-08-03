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
                    sh """
                docker -H ${DOCKER_HOST} run --rm \
  --name flyway_public \
  -e FLYWAY_URL=jdbc:postgresql://host.docker.internal:5432/postgres \
  -e FLYWAY_USER=postgres \
  -e FLYWAY_PASSWORD=admin@123 \
  -e FLYWAY_SCHEMAS=public \
  -e FLYWAY_TABLE=flyway_public_history \
  -v .:/flyway/sql \
  flyway/flyway:latest migrate

                     """
                }
            }
        }
    }
}