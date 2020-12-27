FROM alpine:edge

ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
ARG ALPINE_MIRROR=dl-cdn.alpinelinux.org
ARG SOURCES="/etc/apk/repositories"

# Tell Puppeteer to skip installing Chrome. We'll be using the installed package.
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
ENV NODE_ENV=production

RUN set -ex && \
    sed -i 's/dl-cdn.alpinelinux.org/'$ALPINE_MIRROR'/g' $SOURCES && \
    apk update && apk upgrade && \
    apk add --no-cache \
        chromium \
        nss \
        harfbuzz \
        ca-certificates \
        wqy-zenhei --repository https://$ALPINE_MIRROR/alpine/edge/testing \
        nodejs \
        yarn \
        dumb-init && \
    yarn add puppeteer && \
    yarn cache clean && \
    rm -rf /root/.cache /tmp/* /var/lib/apt/* /var/cache/* /var/log/*

# Add user so we don't need --no-sandbox.
RUN addgroup -S sandbox && adduser -S -g sandbox sandbox \
    && mkdir -p /home/sandbox/Downloads \
    && mkdir -p /app \
    && chown -R sandbox:sandbox /home/sandbox \
    && chown -R sandbox:sandbox /app

WORKDIR /app

# Run everything after as non-privileged user.
USER sandbox

ENTRYPOINT ["dumb-init", "--"]