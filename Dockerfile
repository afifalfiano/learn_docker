FROM golang:latest

COPY main.go /app/main.go

CMD ["go", "run", "main.go"]




