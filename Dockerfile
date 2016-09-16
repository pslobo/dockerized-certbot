FROM alpine:3.3
MAINTAINER Pedro Lobo <https://github.com/pslobo>

WORKDIR /opt/certbot
ENV PATH /opt/certbot/venv/bin:$PATH

RUN export BUILD_DEPS="git \
                build-base \
                libffi-dev \
                linux-headers \
                openssl-dev \
                py-pip \
                python-dev" \
    && apk -U upgrade \
    && apk add dialog \
                python \
                augeas-libs \
                ${BUILD_DEPS} \

    && pip --no-cache-dir install virtualenv \
    && git clone https://github.com/letsencrypt/letsencrypt /opt/certbot/src \
    && virtualenv --no-site-packages -p python2 /opt/certbot/venv \
    && /opt/certbot/venv/bin/pip install \
        -e /opt/certbot/src/acme \
        -e /opt/certbot/src \
        -e /opt/certbot/src/certbot-apache \
        -e /opt/certbot/src/certbot-nginx\
	&& apk del ${BUILD_DEPS} \
    && rm -rf /var/cache/apk/*

EXPOSE 80 443
VOLUME /etc/letsencrypt /var/lib/letsencrypt /var/www

ENTRYPOINT ["certbot"]
