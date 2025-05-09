ARG BUILD_FROM
ARG BUILD_ARCH
FROM ${BUILD_FROM}

# copy only the arch-specific binary
COPY bma-daemon-${BUILD_ARCH} /opt/bma-daemon

# your run.sh and permissions
COPY run.sh /run.sh
RUN chmod +x /opt/bma-daemon /run.sh

CMD [ "/run.sh" ]