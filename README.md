Tailscale (system container)
============================

System(d) container for use with Podman Machine, MicroShift, OpenShift Local and Podman Desktop installations, etc.

![Screenshot](./images/screenshot.png)


### Usage
Start the system container:
```
$ podman run -d --name=tailscale --hostname $HOSTNAME-tailscale --network=host --systemd=always --cap-add=NET_ADMIN --cap-add=NET_RAW --device=/dev/net/tun ghcr.io/spotsnel/tailscale-systemd:latest
```

and register the node to your Tailnet
```
$ podman exec -it tailscale tailscale up

To authenticate, visit:

        https://login.tailscale.com/a/...
```

or use the Podman Desktop terminal to do so.