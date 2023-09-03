FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y ca-certificates curl unzip wget
WORKDIR /app
ADD deploy.sh /app/
RUN chmod 777 /app/deploy.sh
ENTRYPOINT [ "/app/deploy.sh" ]
