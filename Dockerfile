###############################################################################
#                                   BUILD
###############################################################################

FROM golang:1.21.0-alpine as builder

ENV WORKDIR /build

WORKDIR $WORKDIR

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o main main.go

###############################################################################
#                                   RUN
###############################################################################

FROM alpine:3.18

ENV WORKDIR /app

WORKDIR $WORKDIR

COPY --from=builder /build/main ./main

RUN chmod +x ./main

CMD ./main
