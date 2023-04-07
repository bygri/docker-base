FROM python:3.11-alpine

EXPOSE 80

RUN apk add --no-cache  --virtual .build \
    openssh build-base \
    python3-dev linux-headers pcre-dev \
  && apk add --no-cache \
    git \
    mailcap \
    pcre \
    mariadb-dev \
    freetype-dev jpeg-dev lcms2-dev openjpeg-dev zlib-dev \
  && python3 -m pip install --no-cache-dir \
    uwsgi~=2.0 \
    mysqlclient~=2.1 \
    Pillow~=9.4 \
  && apk del .build
