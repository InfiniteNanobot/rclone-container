FROM almalinux/10-minimal

RUN microdnf install -y bash curl unzip ca-certificates fuse openssh-clients \
    && curl -fsSL https://rclone.org/install.sh | bash \
    && microdnf remove -y curl unzip \
    && microdnf clean all

ENTRYPOINT ["rclone"]

WORKDIR /data
ENV XDG_CONFIG_HOME=/config
