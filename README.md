# local-business-template

Static Docker deployment for the Ventos e Acos local business website.

## Docker Manager

Use this Compose URL in the Docker Manager URL field:

```text
https://raw.githubusercontent.com/ravidulundu/local-business-template/main/docker-compose.yml
```

Suggested project name:

```text
local-business-template
```

The Compose file builds the site directly from GitHub, so the Docker Manager can deploy it from the URL alone.

## Local Test

```bash
docker compose up -d --build
```

Open:

```text
http://localhost:8080
```

If port `8080` is already in use:

```bash
APP_PORT=8081 docker compose up -d --build
```
