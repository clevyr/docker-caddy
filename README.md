# docker-caddy

Preconfigured Caddy container for local https development environments.

## Pull Command

```sh
docker pull clevyr/caddy
```

## Config

| Variable       | Description                                                                                    | Default      |
|----------------|------------------------------------------------------------------------------------------------|--------------|
| `SITE_ADDRESS` | The [address](https://caddyserver.com/docs/caddyfile/concepts#addresses) to serve requests on. | `clevyr.run` |

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
