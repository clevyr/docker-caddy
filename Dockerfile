FROM caddy:2-alpine

COPY rootfs/ /

ENV SITE_ADDRESS clevyr.run
ENV APP_ADDRESS app
ENV API_ADDRESS app
ENV MAILDEV_ADDRESS maildev
