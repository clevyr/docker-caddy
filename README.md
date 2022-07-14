# docker-caddy

[![Docker Build](https://github.com/clevyr/docker-caddy/actions/workflows/docker.yml/badge.svg)](https://github.com/clevyr/docker-caddy/actions/workflows/docker.yml)

Preconfigured Caddy container for local https development environments.

## Pull Command

```sh
docker pull ghcr.io/clevyr/caddy
```

## Config

| Variable                 | Description                                                                                                              | Default                 |
|--------------------------|--------------------------------------------------------------------------------------------------------------------------|-------------------------|
| `SITE_ADDRESS`           | [Address](https://caddyserver.com/docs/caddyfile/concepts#addresses) used to serve requests.                             | `clevyr.run`            |
| `APP_ADDRESS`            | Upstream for `https://$SITE_ADDRESS/*` and wildcard subdomains.                                                          | `app`                   |
| `API_ADDRESS`            | Upstream for `https://api.$SITE_ADDRESS/*`.                                                                              | `app`                   |
| `BROWSERSYNC_ADDRESS`    | Upstream for `https://$SITE_ADDRESS/browser-sync/*`.                                                                     | `hot:3000`              |
| `BROWSERSYNC_UI_ADDRESS` | Upstream for `https://browsersync.$SITE_ADDRESS/`.                                                                       | `hot:3001`              |
| `HOT_ADDRESS`            | Upstream for `https://hot.$SITE_ADDRESS/`.                                                                               | `hot:3000`              |
| `MAIL_ADDRESS`           | Upstream for `https://mail.$SITE_ADDRESS/*`.                                                                             | `mail`                  |
| `WS_ADDRESS`             | Upstream for `https://ws.$SITE_ADDRESS/*`.                                                                               | `websocket-server:6001` |
| `SOCKETIO_ADDRESS`       | Upstream for `https://$SITE_ADDRESS/socket.io/*`                                                                         | `app`                   |
| `LOG_OUTPUT`             | Log output module. See [Caddy log output modules](https://caddyserver.com/docs/caddyfile/directives/log#output-modules). | `discard`               |

## Usage

### Adding to an app

Add this Docker image to an app's `docker-compose.yml` with a volume bind in a global location. This allows for the root CA to persist between applications.

```yaml
proxy:
  image: clevyr/caddy
  ports:
    - 80:80
    - 443:443
  restart: unless-stopped
  volumes:
    - ~/.config/caddy:/data
```

### Trusting the root CA

Trusting the root CA is safe as long as the file is never shared. This will make sites work with a valid https certificate which is unique for each machine.  
To trust the local root CA on macOS, run the following command:

```sh
security add-trusted-cert -r trustRoot -k ~/Library/Keychains/login.keychain-db ~/.config/caddy/caddy/pki/authorities/local/root.crt
```
