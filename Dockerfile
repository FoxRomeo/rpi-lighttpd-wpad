FROM arm32v6/alpine:3.12
#FROM arm32v6/alpine:latest
MAINTAINER docker@intrepid.de

RUN passwd -l root ; \
 apk add --update lighttpd bash && \
 rm -rf /var/cache/apk/* && \
 mkdir -p /var/cache/lighttpd/compress/ && \
 chown -R lighttpd /var/cache/lighttpd/compress/ && \
 rm -rf /etc/lighttpd/* && \
 addgroup lighttpd tty

#EXPOSE 80

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
