Tailscale (system container)
============================

Systemd container for use with Podman Desktop installations


### Usage

```
$ podman run -d --name=tailscale --hostname $HOSTNAME-tailscale --systemd=always --cap-add=NET_ADMIN --cap-add=NET_RAW --device=/dev/net/tun ghcr.io/spotsnel/tailscale-systemd:latest
```
