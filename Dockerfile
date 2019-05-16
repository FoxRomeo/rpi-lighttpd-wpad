FROM arm32v6/alpine:latest
MAINTAINER docker@intrepid.de

RUN apk add --update lighttpd bash && \
 rm -rf /var/cache/apk/* && \
 mkdir -p /var/cache/lighttpd/compress/ && \
 chown -R lighttpd /var/cache/lighttpd/compress/ && \
 rm -rf /etc/lighttpd/*

#EXPOSE 80

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
