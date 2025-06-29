# ferroos/Dockerfile
FROM debian:bookworm

LABEL org.opencontainers.image.title="FerroOS"
LABEL org.opencontainers.image.description="Modular retro gaming OS for customizable handheld devices"
LABEL org.opencontainers.image.source="https://github.com/ialopezg/ferroos"
LABEL authors="Isidro Lopez <isidro.lopezg@live.com>"

RUN apt-get update && apt-get install -y \
    bash \
    retroarch \
    curl \
    nano \
    systemd \
    && apt-get clean

COPY init.sh /init.sh
COPY frontend/init.sh /opt/frontend/init.sh

RUN chmod +x /init.sh /opt/frontend/init.sh

CMD ["/init.sh"]
