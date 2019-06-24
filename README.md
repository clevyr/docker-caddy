# docker-caddy

Env-based Caddy container for development environments.

## Config
| Variable             | Description                        | Default                |
|----------------------|------------------------------------|------------------------|
| `URL`                | The public url to listen on.       | `0.0.0.0`              |
| `APP_PATH`           | The path to serve static files on. | `/var/www/html/public` |
| `TLS_OPTIONS`        | Configuration for TLS.             | `off`                  |
| `APP_HOST`           | Hostname of the proxied host.      | `app`                  |
| `APP_PORT`           | Port of the proxied host.          | `9000`                 |
| `BASIC_AUTH_OPTIONS` | Basic auth configuration.          |                        |
