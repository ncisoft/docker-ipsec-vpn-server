#FROM debian:buster-slim
FROM hwdsl2/ipsec-vpn-server

ARG BUILD_DATE
ARG VERSION
ARG VCS_REF

WORKDIR /opt/src


COPY ./files/ustc-buster.list /etc/apt/sources.list.d/
COPY ./files/*.gpg /etc/apt/trusted.gpg.d/
COPY ./files/trusted-keys-buster /tmp/
RUN cp /dev/null /etc/apt/sources.list

RUN apt-get -yqq update &&                           \
	DEBIAN_FRONTEND=noninteractive               \
	apt-get -yqq --no-install-recommends install \
	wget curl gawk                               \
	net-tools iptables iproute2


RUN apt-get -yqq autoremove && \
	apt-get -y clean &&    \
	rm -rf /var/lib/apt/lists/*

COPY ./run-ng.sh /opt/src/
RUN chmod 755 /opt/src/run-ng.sh

EXPOSE 500/udp 4500/udp

CMD [ "/opt/src/run-ng.sh" ]


