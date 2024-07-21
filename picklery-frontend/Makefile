NODE_VERSION := 20.15.1
# arm64 for mac, x64 for linux
ARCHITECTURE := $(shell if [ "$$(uname -m)" = "arm64" ] || [ "$$(uname -m)" = "aarch64" ]; then echo "arm64"; else echo "x64"; fi)

.PHONY: server-setup init dev build

server-setup:
	@echo "Installing Node."
	@wget https://nodejs.org/dist/v$(NODE_VERSION)/node-v$(NODE_VERSION)-linux-$(ARCHITECTURE).tar.xz
	@tar -xf node-v$(NODE_VERSION)-linux-$(ARCHITECTURE).tar.xz
	@mv node-v$(NODE_VERSION)-linux-$(ARCHITECTURE) /app/nodejs
	@node --version

init:
	npm install

dev:
	npm run dev

build:
	npm run build

help:
	@echo "Makefile for frontend"
	@echo "   init     - install frontend package dependencies"
	@echo "   dev      - stand up frontend dev environment"
	@echo "   build    - build frontend output to /dist"
	@echo "   help     - show this help message"