# ferroos/Dockerfile
FROM debian:bookworm
LABEL authors="ialopezg"

RUN apt-get update && apt-get install -y \
    bash \
    retroarch \
    curl \
    nano \
    systemd \
    && apt-get clean

COPY init.sh /init.sh
RUN chmod +x /init.sh

CMD ["/init.sh"]
