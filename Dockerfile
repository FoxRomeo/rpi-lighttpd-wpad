FROM arm32v6/alpine:3.12
#FROM arm32v6/alpine:latest
MAINTAINER docker@intrepid.de

COPY health.sh /

RUN passwd -l root ; \
 chmod 755 /health.sh && \
 apk add --update lighttpd bash && \
 rm -rf /var/cache/apk/* && \
 mkdir -p /var/cache/lighttpd/compress/ && \
 chown -R lighttpd /var/cache/lighttpd/compress/ && \
 rm -rf /etc/lighttpd/* && \
 addgroup lighttpd tty

#EXPOSE 80

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]

# HEALTHCHECK --start-period=1m --interval=1m --timeout=5s CMD /health.sh
