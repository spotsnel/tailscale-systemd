Tailscale (system container)
============================

Systemd container for use with Podman Machine, MicroShift, OpenShift Local and Podman Desktop installations, etc.


### Usage
Start the system container:
```
$ podman run -d --name=tailscale --hostname $HOSTNAME-tailscale --network=host --systemd=always --cap-add=NET_ADMIN --cap-add=NET_RAW --device=/dev/net/tun ghcr.io/spotsnel/tailscale-systemd:latest
```

and register
```
$ podman exec -it tailscale tailscale up

To authenticate, visit:

        https://login.tailscale.com/a/...
```
