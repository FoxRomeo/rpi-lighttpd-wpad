#!/bin/bash

EXITCODE=0


if [[ -z "${SERVER_PORT}" ]]; then
 SERVER_PORT=`grep "^server.port" /etc/lighttpd/lighttpd.conf | sed s/"#.*"// | sed -e s/"[[:space:]]\+"//g | sed s/".*="//`
fi
if netstat -an | grep "LISTEN" | grep "${SERVER_PORT}" > /dev/null; then
    echo "listening for connections on port ${SERVER_PORT}. HEALTHY"
else
    echo "not listening for connections on port ${SERVER_PORT}. UNHEALTHY"
    EXITCODE=1
fi


exit $EXITCODE
