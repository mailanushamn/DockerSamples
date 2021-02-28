FROM golang:1.12.0-alpine3.9
RUN apk add --no-cache git
RUN mkdir /app
ADD . /app	
WORKDIR /app
EXPOSE 3360
RUN go build -o server /app/cmd/server/main.go
CMD ["/app/server"]


FROM golang:1.12.0-alpine3.9
RUN apk add --no-cache git
RUN mkdir /app
ADD . /app	
WORKDIR /app
EXPOSE 3360
RUN go build -o cronjob /app/cmd/cronjob/*.go
ENTRYPOINT ["/app/cronjob", "-type"]
CMD ["/app/cronjob"]


FROM golang:1.12.0-alpine3.9
RUN apk add --no-cache git
RUN mkdir /app
ADD . /app	
WORKDIR /app
RUN go build -o creatorJob /app/cmd/creator-job/main.go
CMD ["/app/creatorJob"]
