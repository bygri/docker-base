FROM python:3.12-alpine

EXPOSE 80

RUN apk add --no-cache  --virtual .build \
    openssh build-base \
    python3-dev linux-headers pcre-dev \
  && apk add --no-cache \
    git \
    mailcap \
    pcre \
  && python3 -m pip install --no-cache-dir \
    uwsgi~=2.0 \
  && apk del .build
