FRONTEND_DIR ?= picklery-frontend
BACKEND_DIR ?= picklery-backend

.PHONY: init serve frontend.% backend.%

init:
	@make frontend.init
	@make backend.init
	
serve:
	@make frontend.build
	@make backend.start
	
frontend.%:
	@make -C $(FRONTEND_DIR) $*
	
backend.%:
	@make -C $(BACKEND_DIR) $*
	
help:
	@echo "Meta-make file for picklery project"
	@echo "   init             - install all subproject package dependencies"
	@echo "   serve            - stand up entire application"
	@echo "   frontend.[cmd]   - run [cmd] in frontend makefile"
	@echo "   backend.[cmd]    - run [cmd] in backend makefile"
	@echo "   help             - show this help message"