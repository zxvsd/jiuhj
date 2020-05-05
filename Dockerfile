FROM alpine:3.6
ENV VER=2.11.0 METHOD=chacha20 PASSWORD=ss123456
ENV TLS_PORT=443 PORT=8080
RUN apk add --no-cache curl \
  && curl -sL https://github.com/xiaokaixuan/gost-heroku/releases/download/${VER}/gost-linux-amd64-${VER}.gz | gzip -d \
  && mkdir gost && mv gost-linux-amd64-${VER} gost/gost && chmod a+x gost/gost
WORKDIR /gost
EXPOSE ${TLS_PORT} $PORT
CMD exec /gost/gost -L=tls://:${TLS_PORT}/:$PORT -L=ws://$METHOD:$PASSWORD@:$PORT

