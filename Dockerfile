FROM alpine

RUN apk --update add git openssh-client docker-cli

COPY build.sh /

CMD ["/build.sh"]
