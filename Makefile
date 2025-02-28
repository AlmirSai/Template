# Local binary directory for storing go binaries (e.g., golangci-lint, server binary)
LOCAL_BIN:=$(CURDIR)/bin

# Install Go module dependencies and tidy up the go.mod file
deps:
	@echo "Tidying up Go modules..."
	@go mod tidy
	@go mod vendor
	@echo "Go modules installed and tidied."

# Build the Go project, creating the server binary
build:
	@echo "Building the server binary..."
	@go build -o $(LOCAL_BIN)/server ./cmd/server/main.go
	@echo "Build complete."

# Run all tests in the project (verbose output)
test:
	@echo "Running tests..."
	@go test ./... -v
	@echo "Test execution complete."

# Generate Go code from Proto files
generate:
	@echo "Generating gRPC code from Proto files..."
	@protoc --go_out=. --go-grpc_out=. --grpc-gateway_out=. --openapiv2_out=. api/*.proto
	@echo "gRPC code generation complete."

# Clean up generated binaries in the local bin directory
clean:
	@echo "Cleaning up generated binaries..."
	@rm -rf $(LOCAL_BIN)/*
	@echo "Cleanup complete."

# Quick summary of all available targets
help:
	@echo "Available make targets:"
	@echo "  deps                    Install Go dependencies and tidy the go.mod file."
	@echo "  build                   Build the Go project and create the server binary."
	@echo "  test                    Run tests in the project."
	@echo "  generate                Generate gRPC code from Proto files."
	@echo "  clean                   Remove generated binaries from the local bin directory."
	@echo "  install                 Run 'install-golangci-lint' and 'deps' in one go."

# Run the linter using Docker for consistent environment
