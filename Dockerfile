FROM alpine:3.6

ENV VER=2.11.0 METHOD=chacha20 PASSWORD=eyp7q12dgsmx8jnekkhp
ENV TLS_PORT=443

RUN apk add --no-cache curl \
  && curl -sL https://github.com/ginuerzh/gost/releases/download/v${VER}/gost-linux-amd64-${VER}.gz | gzip -d \
  && mv gost-linux-amd64 gost && chmod a+x gost/gost

WORKDIR /gost
EXPOSE ${TLS_PORT}

CMD exec /gost/gost -L ws://$METHOD:$PASSWORD@:${TLS_PORT}

