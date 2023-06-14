FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install -y ca-certificates curl unzip wget
RUN apk add --no-cache --virtual .build-deps ca-certificates curl unzip wget
ADD deploy.sh /deploy.sh
RUN chmod +x /deploy.sh
CMD /deploy.sh
