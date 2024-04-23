FROM ghcr.io/sagernet/sing-box:v1.8.11
RUN apk upgrade\
&&  apk add jq \
&& rm -rf /var/cache/apk/*
COPY ./sing-box.getcert.sh /usr/bin/startup.sh
RUN chmod +x /usr/bin/startup.sh
ENTRYPOINT [ "startup.sh" ]
