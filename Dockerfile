FROM alpine:3.10.3@sha256:e4355b66995c96b4b468159fc5c7e3540fcef961189ca13fee877798649f531a AS build

ARG CHEAT_VERSION=3.2.2
RUN apk add curl \
    && curl \
        -L \
        https://github.com/cheat/cheat/releases/download/$CHEAT_VERSION/cheat-linux-amd64 \
        -o cheat \
    && chmod a+x cheat

FROM scratch

COPY --from=build cheat /usr/local/bin/cheat
COPY src/conf.yml /usr/local/etc/cheat/conf.yml
COPY cheatsheets/ /usr/local/share/cheat/community/

ENV CHEAT_CONFIG_PATH="/usr/local/etc/cheat/conf.yml"
ENTRYPOINT ["/usr/local/bin/cheat"]
