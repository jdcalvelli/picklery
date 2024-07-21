GO_VERSION := 1.22.5
# arm64 for mac, amd64 for linux
ARCHITECTURE := $(shell if [ "$$(uname -m)" = "arm64" ] || [ "$$(uname -m)" = "aarch64" ]; then echo "arm64"; else echo "amd64"; fi)

.PHONY: setup init run

setup:
	@echo "Installing Go."
	@wget https://go.dev/dl/go$(GO_VERSION).linux-$(ARCHITECTURE).tar.gz
	@tar -xzf go$(GO_VERSION).linux-$(ARCHITECTURE).tar.gz
	@mv go /app/golang
	@go version

init:
	go mod download

run:
	go run main.go

help:
	@echo "Makefile for backend"
	@echo "   setup    - install correct go version"	
	@echo "   init     - install backend package dependencies"
	@echo "   run      - build and run backend"
	@echo "   help     - show this help message"