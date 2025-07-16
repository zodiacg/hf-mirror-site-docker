# Docker version of HF-mirror

You can use this docker image to deploy your own version of [https://hf-mirror.com/](https://hf-mirror.com/).

**The deployed service doesn't provide TLS. It is designed to work with a reverse proxy in front of it.**

## Quick Start

```bash
docker run -d \
  --name hf-mirror \
  -p 8080:80 \
  -e MIRROR_HOST=your-domain.com \
  -e MIRROR_HOST_REGEXP=your-domain\\.com \
  ghcr.io/zodiacg/hf-mirror-site-docker:latest
```

Replace `your-domain.com` with your actual domain.

## Setup

### Domain Resolution

If your domain for hosting Huggingface mirror is `MIRROR_HOST`, the following domain should point to your server:

* `MIRROR_HOST`
* `cdn-lfs.MIRROR_HOST`
* `cdn-lfs-us-1.MIRROR_HOST`

It is recommened to just set `*.MIRROR_HOST` to the same server to support later updates.

### Environment Variables

Two env var needs to be sed:

```
MIRROR_HOST=hf-mirror.com
MIRROR_HOST_REGEXP=hf-mirror\\.com
```

`MIRROR_HOST` is for the main domain name.

`MIRROR_HOST_REGEXP` is for the regular expression to capture the main domain name, used for filtering requests. In most cases just use `\\` to escape every dot.
