FROM jenkins:latest

USER root

COPY ["entrypoint.sh", "/"]

ENTRYPOINT ["/bin/bash","-c","./entrypoint.sh"]
