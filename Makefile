LOCAL_BIN:=$(CURDIR)/bin

install-golangci-lint:
    GOBIN=$(LOCAL_BIN) go install github.com/golangci/golangci-lint/cmd/golangci-lint@v1.61.0

lint:
    $(LOCAL_BIN)/golangci-lint run ./... --config .golangci.pipeline.yaml

# Install dependencies
deps:
    go mod tidy
    go mod vendor

# Build the project
build:
    go build -o $(LOCAL_BIN)/server ./cmd/server/main.go

# Run tests
test:
    go test ./... -v

# Generate gRPC code
generate:
    protoc --go_out=. --go-grpc_out=. --grpc-gateway_out=. --openapiv2_out=. api/*.proto

# Clean up binaries
clean:
    rm -rf $(LOCAL_BIN)/*