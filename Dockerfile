FROM abiosoft/caddy:1.0.0-no-stats

ENV ACME_AGREE=true

RUN set -x \
    && apk --no-cache add \
        bash \
        gettext

COPY rootfs/ /

WORKDIR /data

ENTRYPOINT ["bash", "/entrypoint"]
