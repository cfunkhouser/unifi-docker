# A Docker image to run Unifi Controller.
#
# Derived from: https://help.ubnt.com/hc/en-us/articles/220066768
FROM debian:jessie-slim
MAINTAINER Christian Funkhouser <christian.funkhouser@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Copy the UniFi list file to sources.list.d so APT can find them.
ADD ./unifi-sources.list /etc/apt/sources.list.d/10unifi-sources.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50 && \
    apt-get update -q -y --fix-missing && \
    apt-get install -t jessie-backports -q -y --no-install-recommends \
        ca-certificates-java \
        openjdk-8-jre-headless && \
    apt-get install -t stable -q -y --no-install-recommends unifi

# Information about these ports taken from:
# https://help.ubnt.com/hc/en-us/articles/218506997
EXPOSE  \
   3478/udp \
   6789/tcp \
   8080/tcp \
   8443/tcp \
   8843/tcp \
   8880/tcp
VOLUME /usr/lib/unifi/data
WORKDIR /usr/lib/unifi
CMD ["java", "-Xmx256M", "-jar", "/usr/lib/unifi/lib/ace.jar", "start"]
