from golang:latest as go_code

WORKDIR /go/src 

COPY /full-cycle-rocks .

RUN go mod init example/hello  && \
    go build -o ../bin/fc-rocks

ENTRYPOINT [ "../bin/fc-rocks" ]


FROM scratch
COPY --from=go_code ./go/bin/ .

ENTRYPOINT ["./fc-rocks"]