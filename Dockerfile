FROM alpine:3.6

ENV VER=2.11.0 METHOD=aes-256-cfb PASSWORD=eyp7q12dgsmx8jnekkhp
ENV TLS_PORT=443

RUN apk add --no-cache curl \
  && curl -sL https://github.com/VerSign010/gost-heroku/releases/download/${VER}/gost-linux-amd64-${VER}.gz | gzip -d \
  && mkdir gost && mv gost-linux-amd64-${VER} gost/gost && chmod a+x gost/gost

WORKDIR /gost
EXPOSE ${TLS_PORT}

CMD exec /gost -L ws://$METHOD:$PASSWORD@:${TLS_PORT}

