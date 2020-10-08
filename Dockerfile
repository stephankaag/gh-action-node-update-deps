FROM alpine/git AS build-env
RUN mkdir /ghcli
WORKDIR /ghcli
RUN wget https://github.com/cli/cli/releases/download/v1.1.0/gh_1.1.0_linux_386.tar.gz -O ghcli.tar.gz
RUN tar --strip-components=1 -xf ghcli.tar.gz

FROM node:lts-alpine
COPY --from=build-env /ghcli/bin/gh /usr/local/bin/gh
RUN apk add git
WORKDIR /action

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]