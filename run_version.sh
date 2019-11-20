#!/bin/bash

VERSION=`docker run -t $1 ${COMMANDSHELL} -c "lighttpd -V | grep '^lighttpd\/' | sed -e s/'^lighttpd\/'// | sed -e s/' (ssl).*$'//" | sed -e 's/\r//'`

echo ${VERSION}