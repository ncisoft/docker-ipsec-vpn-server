#FROM debian:buster-slim
FROM hwdsl2/ipsec-vpn-server


COPY ./files/ustc-buster.list /etc/apt/sources.list.d/
RUN cp /dev/null /etc/apt/sources.list

RUN apt-get -yqq update &&                           \
	DEBIAN_FRONTEND=noninteractive               \
	apt-get -yqq --no-install-recommends install \
	curl ipset ppp lsof ipset vim


RUN mkdir -p /etc/redsocks2

COPY ./run_in_docker.sh .
COPY files/rules.v4 .
COPY files/strongSwan-deploy.sh .
COPY files/init-l2tp-redsocks2.sh .
COPY files/init-ipset.sh .

COPY files/redsocks2 /usr/local/sbin/
COPY files/redsocks.conf /etc/redsocks2/

COPY ./run_in_docker.sh /opt/src
COPY ./run-old.sh /opt/src

RUN true &&                                      \
	chmod 755 /opt/src/run.sh &&                 \
	chmod 755 /opt/src/strongSwan-deploy.sh &&   \
	chmod 755 /opt/src/init-l2tp-redsocks2.sh && \
	chmod 755 /opt/src/init-ipset.sh &&          \
	true &&                                      \
	chmod 755 /opt/src/run-old.sh &&             \
	chmod 755 /opt/src/run_in_docker.sh



EXPOSE 500/udp 4500/udp

CMD ["/opt/src/run_in_docker.sh"]
