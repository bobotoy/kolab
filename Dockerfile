FROM ubuntu:16.04
COPY files/* /

RUN apt-get update
RUN apt-get install -y ca-certificates curl unzip wget
ADD deploy.sh /deploy.sh
RUN chmod +x /deploy.sh
CMD /deploy.sh
ENTRYPOINT [ "/deploy.sh" ]
