# Containerized UniFi Software

## Unifi Controller

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
  unifi
```

## Unifi Video Controller

My personal containerized version of the UniFi Video Controller.

To run:
```
$ docker run -d \
  -p 6666:6666/tcp \
  -p 7004:7004/tcp \
  -p 7080:7080/tcp \
  -p 7443:7443/tcp \
  -p 7445:7445/tcp \
  -p 7446:7446/tcp \
  -p 7447:7447/tcp \
  -v ${WHEREVER_YOU_WANT_THE_DATA}:/var/lib/unifi-video \
  --name unifi-video \
  --privileged \
  unifi-video
```