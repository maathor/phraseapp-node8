FROM node:8.16.0-alpine

ENV VERSION 1.13.0

RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

RUN pip3 --no-cache-dir install --upgrade awscli

RUN set -ex \
    && apk add --no-cache ca-certificates

RUN set -ex \
        && apk add --no-cache --virtual .phraseapp-build \
                curl \
        && curl -fSL -o /usr/local/bin/phraseapp "https://github.com/phrase/phraseapp-client/releases/download/${VERSION}/phraseapp_linux_amd64" \
        && chmod +x /usr/local/bin/phraseapp \
	&& apk del .phraseapp-build

ENV PATH "$PATH:/usr/local/bin"