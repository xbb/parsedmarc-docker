# parsedmarc docker image

## What is parsedmarc

parsedmarc is an open source DMARC report analyzer which can parse
the reports from IMAP and output them as JSON or send
them to Elasticsearch and much more.

See all the features from the official documentation <https://domainaware.github.io/parsedmarc>

Credits and official repository here <https://github.com/domainaware/parsedmarc/>

## How to use this image

### If you just want to run the command

```sh
docker run -it --rm xbblabs/parsedmarc --help
```

### If you want to configure it with docker-compose.yml

```yml
version: "2.2"
services:
 parsedmarc:
  container_name: "parsedmarc"
  image: "xbblabs/parsedmarc:latest"
  volumes:
   - ./parsedmarc.ini:/etc/parsedmarc.ini
   - geoip-data:/usr/share/GeoIP:ro
  command: ["-c", "/etc/parsedmarc.ini"]
  init: true
  restart: "unless-stopped"
```
