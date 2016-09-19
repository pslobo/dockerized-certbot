# What is Certbot

> [Certbot](https://certbot.eff.org) is an easy-to-use automatic client that fetches and deploys SSL/TLS certificates for your webserver. Certbot was developed by EFF and others as a client for [Let's Encrypt](https://letsencrypt.org) and was previously known as "the official Let’s Encrypt client" or "the Let’s Encrypt Python client." Certbot will also work with any other CAs that support the ACME protocol.


## How to use this image

### Start a Certbot instance with the Apache plugin
In it's simplest form, starting an instance is as easy as:

    docker run -it \
               --rm \
               --net host \
               -v /etc/letsencrypt:/etc/letsencrypt \
               -v /var/lib/letsencrypt:/var/lib/letsencrypt \
               -v /var/www:/var/www \
               palobo/certbot -t install --apache -d DOMAIN

- `DOMAIN` is the domain name to apply. For multiple domains use multiple -d flags.


### Start a Certbot instance with the Webroot plugin

    docker run -it \
               --rm \
               -v /etc/letsencrypt:/etc/letsencrypt \
               -v /var/lib/letsencrypt:/var/lib/letsencrypt \
               -v /var/www:/var/www \
               palobo/certbot -t certonly --webroot -w WEBROOT_PATH -d DOMAIN

- `WEBROOT_PATH` is a public_html / webroot path. This can be specified multiple times to handle different domains; each domain will have the webroot path that preceded it and
- `DOMAIN` is the domain name to apply. For multiple domains use multiple -d flags

### Start a Certbot instance with the Standalone plugin

    docker run -it \
               --rm \
               -p 443:443 \
               -v /etc/letsencrypt:/etc/letsencrypt \
               -v $(pwd)/log:/var/log/letsencrypt \
               palobo/certbot certonly --standalone \
               -t -m me@myemail.com -d my.domain.com

## Exposed Ports

- 80
- 443

## Exported Volumes

- `/etc/letsencrypt`
- `/var/lib/letsencrypt`
- `/var/www`
