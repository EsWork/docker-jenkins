all: build

build:
	@docker build --tag=eswork/jenkins .

release: build
	@docker build --tag=eswork/jenkins:$(shell cat VERSION) .
