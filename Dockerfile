FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y ca-certificates curl unzip wget
ADD deploy.sh /tmp/deploy.sh
RUN chmod 777 /tmp/deploy.sh
USER 10001
ENTRYPOINT [ "/tmp/deploy.sh" ]
