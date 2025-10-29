FROM debian:latest
LABEL authors="Fridolin1"
EXPOSE 67/udp

RUN apt update && apt upgrade -y
RUN apt install kea-dhcp4-server -y
RUN mkdir -p /var/log/kea && chown kea:kea /var/log/kea

COPY kea-dhcp4.conf.json /etc/kea/kea-dhcp4.conf

CMD ["kea-dhcp4", "-c", "/etc/kea/kea-dhcp4.conf", "-f"]
