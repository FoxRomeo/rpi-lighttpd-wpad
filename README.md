# rpi-lighttpd-wpad
<a href="https://hub.docker.com/r/intrepidde/rpi-lighttpd-wpad"><img src="https://img.shields.io/docker/pulls/intrepidde/rpi-lighttpd-wpad.svg?style=plastic&logo=appveyor" alt="Docker pulls"/></a><br>
Raspberry Pi (RPi) Docker container with lighttpd
(arm32v6 aka RPi A/B/B+ and later)

## Example usage is as a webserver to make a wpad/proxypac available

add to dhcpd3: ```option wpad-url code 252 = text; option wpad-url "http://wapd./proxy.pac\n";```

add "wapd." to DNS

create proxy.pac/wapd.dat

```docker run -d --restart=unless-stopped --name rpi-lighttpd-wpad --hostname="wapd." -v /lighttpd.conf:/etc/lighttpd/lighttpd.conf -v /proxy.pac:/var/www/localhost/htdocs/proxy.pac -v /proxy.pac:/var/www/localhost/htdocs/wpad.dat -p 80:80 intrepidde/rpi-lighttpd-wpad```


__Added health.sh__

checking for open port from server.port in /etc/lighttpd/lighttpd.conf (or define environment ```SERVER_PORT=xx```)


* 1.0 based on armhf/alpine:3.4
* 1.1 based on arm32v6/alpine:3.6
* after 1.1 based on arm32v6/alpine:latest and tag/version is the version of lighttpd used

__based on arm32v6/alpine:3.12 (due to restrictions with newer versions)__


https://hub.docker.com/r/intrepidde/rpi-lighttpd-wpad

https://www.intrepid.de/index.php/projects/git-docker/6-intrepidde-rpi-lighttpd-wpad
