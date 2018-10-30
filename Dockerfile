FROM debian:jessie
ENV DEBIAN_FRONTEND noninteractive
MAINTAINER elonlee
ADD frp_0.21.0_linux_amd64 /tmp/frp
ADD run.sh /tmp/run.sh
EXPOSE 80 443 7777 8888
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y --no-install-recommends tinyproxy
RUN apt-get install -y --no-install-recommends lsof
RUN mkdir /var/run/tinyproxy && \
    chown nobody /var/run/tinyproxy
RUN touch /var/log/tinyproxy/tinyproxy.log && \
    chown nobody /var/log/tinyproxy/tinyproxy.log
RUN chown nobody /tmp/run.sh && chmod +x /tmp/run.sh
RUN set -ex \
   && cd /tmp \
   && install -v -D frp/frps /bin/frps \
   && install -v -D frp/frpc /bin/frpc \
   && install -v -D frpc.ini /bin/frpc.ini
ENTRYPOINT ["/tmp/run.sh"]
