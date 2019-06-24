FROM abiosoft/caddy:1.0.0-no-stats

ENV ACME_AGREE=true

WORKDIR /data

RUN set -x \
    && apk --no-cache add \
        bash \
        gettext

COPY Caddyfile.template entrypoint ./

ENTRYPOINT ["bash", "./entrypoint"]
