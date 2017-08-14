# A Docker image to run Unifi Video Controller.
#
# Derived from:
# - https://community.ubnt.com/t5/UniFi-Video-Blog/Repository-is-back/ba-p/1934793
# - https://community.ubnt.com/t5/UniFi-Video-Blog/UniFi-Video-3-7-1-Release/ba-p/1947714
FROM debian:jessie-slim
MAINTAINER Christian Funkhouser <christian.funkhouser@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Copy the UniFi list file to sources.list.d so APT can find them.
ADD ./unifi-video-sources.list \
    /etc/apt/sources.list.d/10unifi-video-sources.list

RUN wget -O - \
        http://www.ubnt.com/downloads/unifi-video/apt-3.x/unifi-video.gpg.key \
        | apt-key add - && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50 && \
    apt-get update -q -y --fix-missing && \
    apt-get install -t jessie-backports -q -y --no-install-recommends \
        ca-certificates-java \
        openjdk-8-jre-headless && \
    apt-get install -t stable -q -y --no-install-recommends unifi-video

# Information about these ports taken from:
# https://help.ubnt.com/hc/en-us/articles/217875218-UniFi-Video-Ports-Used
EXPOSE  \
   6666/udp \
   7004/tcp \
   7080/tcp \
   7443/tcp \
   7445/tcp \
   7446/tcp \
   7447/tcp
VOLUME \
    /var/lib/unifi-video \
    /var/log/unifi-video
WORKDIR /usr/lib/unifi
CMD ["/usr/sbin/unifi-video", "--nodetach", "start"]
