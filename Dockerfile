FROM golang:latest as builder

WORKDIR /var/www

COPY . .

RUN go build main.go

FROM scratch

WORKDIR /var/www

COPY --from=builder /var/www/main .

CMD ["./main"]