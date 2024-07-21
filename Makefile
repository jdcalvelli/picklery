FRONTEND_DIR ?= picklery-frontend
BACKEND_DIR ?= picklery-backend

.PHONY: setup init serve frontend.% backend.%

setup:
	make frontend.setup
	make backend.setup

init:
	make frontend.init
	make backend.init
	
serve:
	make frontend.build
	make backend.run
	
frontend.%:
	make -C $(FRONTEND_DIR) $*
	
backend.%:
	make -C $(BACKEND_DIR) $*
	
help:
	@echo "Meta-make file for picklery project"
	@echo "   setup    - ensure correct toolchains are installed"
	@echo "   init     - install package dependencies for node and go subprojects"
	@echo "   serve    - build frontend and start server"
	@echo "   help     - show this help message"