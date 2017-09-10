FROM ubuntu:16.04

EXPOSE 9080

RUN apt-get update && \
	apt-get -y install curl

# Setup Realm's PackageCloud repository
RUN curl -s https://packagecloud.io/install/repositories/realm/realm/script.deb.sh | bash

#Update Packages 
RUN apt-get update

# Install the Realm Object Server
RUN apt-get -y install realm-object-server-developer

# Enable the service
RUN systemctl enable realm-object-server

VOLUME /etc/realm/

EXPOSE 9080

# Start the service
CMD /usr/bin/realm-object-server -c /etc/realm/configuration.yml