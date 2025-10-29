FROM debian:latest
LABEL authors="Fridolin1"
EXPOSE 67/udp

RUN apt update && apt upgrade -y
RUN apt install kea-dhcp4-server -y
RUN mkdir -p /var/log/kea && chmod 777 -R /var/log/kea
RUN mkdir -p /var/run/kea && chmod 777 -R /var/run/kea

COPY kea-dhcp4.conf.json /etc/kea/kea-dhcp4.conf

CMD ["kea-dhcp4", "-c", "/etc/kea/kea-dhcp4.conf", "-d"]
