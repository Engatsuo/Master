FROM r-base:4.2.2

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && \
    apt-get -y autoremove && \
    apt-get clean && \
	mkdir /var/log/Masteranalysis

ENV LD_LIBRARY_PATH /usr/lib/jvm/default-java/lib/server
	
COPY Docker/LibraryInstall.R /opt

WORKDIR /opt

RUN r LibraryInstall.R