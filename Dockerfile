FROM alpine:3.10.3@sha256:e4355b66995c96b4b468159fc5c7e3540fcef961189ca13fee877798649f531a

RUN apk add --no-cache --virtual .build-deps \
    curl

ARG CHEAT_VERSION=3.2.1
RUN curl -L https://github.com/cheat/cheat/releases/download/$CHEAT_VERSION/cheat-linux-amd64 -o /usr/local/bin/cheat
RUN chmod a+x /usr/local/bin/cheat

RUN apk del .build-deps

COPY src/conf.yml /root/.config/cheat/conf.yml
COPY cheatsheets/ /usr/local/share/cheat/community/

ENTRYPOINT ["/usr/local/bin/cheat"]
