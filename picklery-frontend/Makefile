NODE_VERSION := 20.15.1

.PHONY: setup init dev build

setup:
	@echo "Installing Node."
	@wget https://nodejs.org/dist/v$(NODE_VERSION)/node-v$(NODE_VERSION)-linux-x64.tar.xz
	@tar -xf node-v$(NODE_VERSION)-linux-x64.tar.xz
	@mv node-v$(NODE_VERSION)-linux-x64 /app/nodejs
	@node --version

init:
	npm install

dev:
	npm run dev

build:
	npm run build

help:
	@echo "Makefile for frontend"
	@echo "   setup    - install correct node version"
	@echo "   init     - install frontend package dependencies"
	@echo "   dev      - spin up dev environment"
	@echo "   build    - build output to /dist"
	@echo "   help     - show this help message"