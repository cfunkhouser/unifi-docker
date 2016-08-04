# A Docker image to run Unifi Controller.
FROM debian:jessie
MAINTAINER Christian Funkhouser <christian.funkhouser@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Copy the UniFi and MongoDB lists file to sources.list.d so APT can find them.
ADD ./unifi.list /etc/apt/sources.list.d/unifi.list
ADD ./mongodb.list /etc/apt/sources.list.d/mongodb.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 && \
    apt-get update -q -y --fix-missing && \
    apt-get install -q -y mongodb-10gen unifi

EXPOSE  8443 8880 8080
VOLUME /usr/lib/unifi/data
WORKDIR /usr/lib/unifi
CMD ["java", "-Xmx256M", "-jar", "/usr/lib/unifi/lib/ace.jar", "start"]
