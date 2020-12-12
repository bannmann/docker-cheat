FROM alpine:3.10.3@sha256:e4355b66995c96b4b468159fc5c7e3540fcef961189ca13fee877798649f531a AS build

ARG CHEAT_VERSION=4.2.0
RUN apk add curl gzip \
    && curl \
        -L \
        https://github.com/cheat/cheat/releases/download/$CHEAT_VERSION/cheat-linux-amd64.gz \
        -o cheat.gz \
    && gunzip cheat \
    && chmod a+x cheat

RUN mkdir --parents /v/workdir /v/personal

FROM scratch

COPY --from=build v/ /v/
COPY --from=build cheat /usr/local/bin/cheat
COPY src/conf.yml /usr/local/etc/cheat/conf.yml
COPY cheatsheets/ /usr/local/share/cheat/community/

ENV CHEAT_CONFIG_PATH="/usr/local/etc/cheat/conf.yml"

WORKDIR /v/workdir

ENTRYPOINT ["/usr/local/bin/cheat"]
