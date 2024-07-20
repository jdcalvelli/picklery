FRONTEND_DIR ?= picklery-frontend
BACKEND_DIR ?= picklery-backend

.PHONY: frontend.% backend.% serve

frontend.%:
	make -C $(FRONTEND_DIR) $*
	
backend.%:
	make -C $(BACKEND_DIR) $*
	
serve:
	make frontend.build
	make backend.run
	
help:
	@echo "Meta-make file for picklery project"
	@echo "   serve      - build frontend and start server"
	@echo "   help       - show this help message"