FROM caddy:2.6.4-alpine

COPY rootfs/ /

ENV API_ADDRESS app
ENV APP_ADDRESS app
ENV HOT_ADDRESS hot:5173
ENV MAIL_ADDRESS mail
ENV SITE_ADDRESS clevyr.run
ENV WS_ADDRESS websocket-server:6001
ENV SOCKETIO_ADDRESS $APP_ADDRESS
ENV LOG_OUTPUT discard
