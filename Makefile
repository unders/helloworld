.PHONY: help
help:
	@echo ""
	@echo "This is a guide on how to:"
	@echo "    - develop microservices"
	@echo "    - and deploy them to Google Container Engine"
	@echo ""
	@echo "Commands:"
	@echo "    make bootstrap     # check required dependencies"
	@echo "    make xxxxx         # next"
	@echo ""
	@echo "Tutorial"
	@echo "    Step 1. $ make bootstrap"
	@echo ""

.PHONY: bootstrap
bootstrap:
	@./bin/bootstrap.sh


