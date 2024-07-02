FROM caddy:2-builder-alpine AS builder

RUN xcaddy build \
    --with github.com/caddyserver/replace-response \
    --with github.com/caddyserver/transform-encoder

FROM caddy:2-alpine

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

RUN mkdir -p /var/www/html/
COPY ./dist/* /var/www/html/
COPY ./scripts/caddy/* /etc/caddy/

ENV MIRROR_HOST hf-mirror.com
ENV MIRROR_HOST_REGEXP hf-mirror\\.com

CMD ["caddy", "run", "--config", "/etc/caddy/Caddyfile", "--adapter", "caddyfile"]

