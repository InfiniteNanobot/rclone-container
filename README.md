# rclone-container

A container image that packages [rclone](https://rclone.org/), intended to be run with Podman (or any OCI-compatible container runtime).

## Build

```bash
podman build -t rclone-container -f Containerfile .
```

## Usage

Config is read from `/config` (`XDG_CONFIG_HOME=/config`) and the working directory is `/data`. The container entrypoint is `rclone`, so pass rclone subcommands as arguments:

```bash
podman run --rm -it -v ./config:/config:Z -v ./data:/data:Z rclone-container version
podman run --rm -it -v ./config:/config:Z rclone-container config
podman run --rm -it -v ./config:/config:Z -v ./data:/data:Z rclone-container sync /data remote:bucket-name
```
