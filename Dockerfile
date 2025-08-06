FROM karthikb21/custom-jenkins-agent:1.1

# Install Compose plugin (v2)
RUN mkdir -p ~/.docker/cli-plugins/ && \
    curl -SL https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64 \
    -o ~/.docker/cli-plugins/docker-compose && \
    chmod +x ~/.docker/cli-plugins/docker-compose