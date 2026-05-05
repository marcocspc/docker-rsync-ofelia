WORKDIR /ofelia/ofelia
RUN git checkout 44ac008a34905eb4ceb540a213a2238e4545b4df
RUN go build -o /go/bin/ofelia .

FROM alpine:3.23.0
COPY --from=ofelia /go/bin/ofelia /usr/bin/ofelia

RUN apk update
RUN apk add \
        rsync \
        tzdata 

RUN mkdir -p /data_to_backup
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]
