FROM python:3.7-alpine

EXPOSE 80

RUN apk add --no-cache  --virtual .build \
    openssh build-base \
    python3-dev linux-headers pcre-dev \
  && apk add --no-cache \
    git \
    mailcap \
    pcre \
  && python3 -m pip install --no-cache-dir \
    uwsgi \
  && apk del .build
