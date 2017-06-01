# Containerized UniFi Controller

My personal containerized version of the UniFi 5 Controller. I use this at home
for Reasons&trade;. You almost certainly should use
https://github.com/jacobalberty/unifi-docker, instead.

To run:
```
$ docker run -d \
  -p 3478:3478/udp \
  -p 6789:6789/tcp \
  -p 8080:8080/tcp \
  -p 8443:8443/tcp \
  -p 8843:8843/tcp \
  -p 8880:8880/tcp \
  -v ${WHEREVER_YOU_WANT_THE_DATA}:/usr/lib/unifi/data \
  cfunkhouser/unifi:latest
```
