FROM debian:bullseye-slim

LABEL org.opencontainers.image.title="Tailscale (systemd)" \
      org.opencontainers.image.description="Tailscale lets you securely connect to your containers without exposing them to the public internet." \
      org.opencontainers.image.authors="Gerard Braad"

RUN apt-get update \
    && apt-get install -y \
        ca-certificates \
        iptables \
        iproute2 \
        procps \
        inotify-tools \
        systemd \
        systemd-sysv \  
        sudo \
        curl \
    && curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg >/dev/null \
    && curl -fsSL https://pkgs.tailscale.com/stable/debian/bullseye.tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list \
    && apt-get update \
    && apt-get install -y \
        tailscale \
    && export SUDO_FORCE_REMOVE=yes \
    && apt-get remove -y \
        sudo \
        curl \
    && apt -y autoremove \
    && rm -rf /var/lib/apt/lists/* \
    && systemctl enable tailscaled

ENTRYPOINT ["/sbin/init"]