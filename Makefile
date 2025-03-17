# Simple Makefile for a Go project

# Build the application
all: build test

build:
	@echo "Building..."
	@cd app && go build -o main cmd/api/main.go

# Run the application
run:
	@cd app && go run cmd/api/main.go

# Create DB container
docker-run:
	@docker compose up --build

# Shutdown DB container
docker-down:
	@docker compose down

# Test the application
test:
	@echo "Testing..."
	@cd app && go test ./... -v

# Integrations Tests for the application
itest:
	@echo "Running integration tests..."
	@cd app && go test ./internal/database -v

# Clean the binary
clean:
	@echo "Cleaning..."
	@cd app && rm -f main

.PHONY: all build run test clean docker-run docker-down itest
