FROM alpine

RUN apk add --no-cache --virtual .build-deps ca-certificates curl unzip wget &&\
    wget -O cloudflared.deb https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb &&\
    dpkg -i cloudflared.deb &&\
    rm -f cloudflared.deb &&\
ADD deploy.sh /deploy.sh
RUN chmod +x /deploy.sh
CMD /deploy.sh
