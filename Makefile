APP_PORT ?= 3000

build:
	docker build \
		--no-cache \
		--tag josh/load-tester \
		--build-arg APP_PORT=${APP_PORT} \
		.