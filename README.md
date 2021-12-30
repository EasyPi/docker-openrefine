OpenRefine
==========

[![](https://github.com/easypi/docker-openrefine/actions/workflows/build.yaml/badge.svg)](https://github.com/EasyPi/docker-openrefine)

[![](http://dockeri.co/image/easypi/openrefine)](https://hub.docker.com/r/easypi/openrefine)

[OpenRefine][1] (formerly Google Refine) is a powerful tool for working with messy
data: cleaning it; transforming it from one format into another; and extending
it with web services and external data.

Please read the [wiki][2] to learn more.

### docker-compose.yml

```yaml
version: "3.8"
services:
  openrefine:
    image: easypi/openrefine
    ports:
      - "3333:3333"
    volumes:
      - ./data:/data
    environment:
      - REFINE_INTERFACE=0.0.0.0
      - REFINE_PORT=3333
      - REFINE_MEMORY=1024M
      - REFINE_DATA_DIR=/data
      - REFINE_EXTRA_OPTS=refine.headless=true
    restart: unless-stopped
```

[1]: http://openrefine.org/index.html
[2]: https://github.com/OpenRefine/OpenRefine/wiki
