FROM jenkins:2.32.2

USER root

COPY ["entrypoint.sh", "/"]

RUN apt-get update && \
    apt-get install sudo && \
    apt-get -y install build-essential && \
    apt-get -y install graphicsmagick imagemagick && \
    chmod 755 /entrypoint.sh

ENTRYPOINT ["/bin/bash","-c","./entrypoint.sh"]
