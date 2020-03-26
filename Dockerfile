FROM docker:stable

RUN apk --no-cache add openssh-client

COPY entrypoint.sh /entrypoint.sh

COPY $GITHUB_WORKSPACE/docker-compose.yml /docker-compose.yml

ENTRYPOINT ["/entrypoint.sh"]