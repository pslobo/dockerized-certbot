# Dockerized Certbot Client

[Certbot](https://certbot.eff.org) is a tool to easily deploy and renew [Let's Encrypt](https://letsencrypt.org) certificates. Being installed on Alpine linux ensures the smallest possible container while still maintaining all it's functionality.


## Usage and Supported Plugins

### Apache
Description: Apache Web Server plugin - Beta


    docker run -it \
               --rm \
               --net host \
               -v /etc/letsencrypt:/etc/letsencrypt \
               -v /var/lib/letsencrypt:/var/lib/letsencrypt \
               -v /var/www:/var/www \
               palobo/certbot -t install -m me@myemail.com --apache -d my.domain.com


### Webroot

    docker run -it \
               --rm \
               -v /etc/letsencrypt:/etc/letsencrypt \
               -v /var/lib/letsencrypt:/var/lib/letsencrypt \
               -v /var/www:/var/www \
               palobo/certbot -t certonly -m me@myemail.com -w /var/www -d my.domain.com

### Standalone

    docker run --rm \
               -it \
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
