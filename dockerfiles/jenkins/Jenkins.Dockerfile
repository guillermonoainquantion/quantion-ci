FROM jenkins/jenkins:lts

# Install the latest Docker CE binaries
USER root
RUN apt-get update && \
    apt-get -y install apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" && \
    apt-get update && \
    apt-get -y install docker-ce

# Install Node for SonarQube
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && \
    apt-get update && \
    apt-get install -y nodejs build-essential

ENV JENKINS_OPTS --prefix=/jenkins

COPY ./dockerfiles/jenkins/entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["/bin/bash","-c","./entrypoint.sh"]
