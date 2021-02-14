FROM nci/buster-slim-base:latest

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

ENV IMAGE_VER $BUILD_DATE
ENV SWAN_VER 4.2
ENV APT_SOURCE_URL https://mirrors.ustc.edu.cn/repogen/conf/debian-https-4-buster
ENV CONF "/media/home/conf"

WORKDIR /opt/src


RUN apt-get -yqq update \
    && DEBIAN_FRONTEND=noninteractive \
       apt-get -yqq --no-install-recommends  install \
	 gpg   gpg-agent ca-certificates \
         wget curl dnsutils iproute2 \
         gawk net-tools iptables \
         strongswan xl2tpd ppp lsof ipset \
         netfilter-persistent iptables-persistent redis-tools \
    && apt-get -yqq autoremove \
    && apt-get -y clean \
    && rm -rf /var/lib/apt/lists/* \
    && update-alternatives --set iptables /usr/sbin/iptables-legacy

COPY ./run.sh /opt/src/run.sh
COPY files/rules.v4 /opt/src/
COPY files/strongSwan-deploy.sh /opt/src/
COPY files/init-l2tp-redsocks2.sh /opt/src/

RUN chmod 755 /opt/src/run.sh
RUN chmod 755 /opt/src/strongSwan-deploy.sh
RUN chmod 755 /opt/src/init-l2tp-redsocks2.sh
RUN chmod 755 /opt/src/run.sh

EXPOSE 500/udp 4500/udp

CMD ["/opt/src/run.sh"]
