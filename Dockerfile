# Stage 1 Build
FROM golang:1.23

WORKDIR /workspace
COPY go.mod main.go ./
COPY templates ./templates/

RUN CGO_ENABLED=0 go build -o cs1660-p2 .

# Stage 2 Final
FROM scratch

COPY --from=0 /workspace/cs1660-p2 ./
COPY --from=0 /workspace/templates ./templates/

CMD ["./cs1660-p2"]