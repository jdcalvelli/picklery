FRONTEND_DIR ?= picklery-frontend

.PHONY: frontend.%

frontend.%:
	make -C $(FRONTEND_DIR) $*
	
help:
	@echo "Meta-make file for picklery project"
	@echo "   frontend.[command]      - run the associated make command for the frontend"
	@echo "   help                    - show this help message"