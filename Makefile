all:run

run:
	@clear
	@echo "Running Tailor Swif..."
	@cd infra/docker && docker compose up --build

build:	
	@clear
	@echo "Building Tailor Swif for production..."
	@cd infra/docker && docker compose -f docker-compose.prod.yml up --build