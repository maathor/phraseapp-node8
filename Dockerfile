FROM node:8.16.0-alpine

ENV VERSION 1.13.0

RUN set -ex \
    && apk add --no-cache ca-certificates

RUN set -ex \
        && apk add --no-cache --virtual .phraseapp-build \
                curl \
        && curl -fSL -o /usr/local/bin/phraseapp "https://github.com/phrase/phraseapp-client/releases/download/${VERSION}/phraseapp_linux_amd64" \
        && chmod +x /usr/local/bin/phraseapp \
	&& apk del .phraseapp-build

ENV PATH "$PATH:/usr/local/bin"