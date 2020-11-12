FROM caddy:2-alpine

COPY rootfs/ /

ENV SITE_ADDRESS clevyr.run
