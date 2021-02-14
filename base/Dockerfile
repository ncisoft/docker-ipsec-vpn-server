FROM debian:buster-slim

ARG BUILD_DATE
ARG VERSION
ARG VCS_REF

LABEL maintainer="Lin Song <linsongui@gmail.com>" \
    org.opencontainers.image.created="$BUILD_DATE" \
    org.opencontainers.image.version="$VERSION" \
    org.opencontainers.image.revision="$VCS_REF" \
    org.opencontainers.image.authors="Lin Song <linsongui@gmail.com>" \
    org.opencontainers.image.title="IPsec VPN Server on Docker" \
    org.opencontainers.image.description="Docker image to run an IPsec VPN server, with both IPsec/L2TP and Cisco IPsec." \
    org.opencontainers.image.url="https://github.com/hwdsl2/docker-ipsec-vpn-server" \
    org.opencontainers.image.source="https://github.com/hwdsl2/docker-ipsec-vpn-server" \
    org.opencontainers.image.documentation="https://github.com/hwdsl2/docker-ipsec-vpn-server"

WORKDIR /opt/src


RUN apt-get -yqq  update \
    && DEBIAN_FRONTEND=noninteractive \
       apt-get -yqq --no-install-recommends  install \
	 gpg gpg-agent ca-certificates

COPY ./files/ustc-buster.list  /etc/apt/sources.list.d/
COPY ./files/trusted-keys-buster  /tmp/
RUN cp /dev/null /etc/apt/sources.list
RUN apt-key add /tmp/trusted-keys-buster && \
    apt-get -yqq update \
    && DEBIAN_FRONTEND=noninteractive \
       apt-get -yqq --no-install-recommends  install \
         wget curl gawk net-tools iptables \
    && apt-get -yqq autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/*


CMD ["bash"]
