all: build

build:
	@docker build --tag=johnwu/jenkins .

release: build
	@docker build --tag=johnwu/jenkins:$(shell cat VERSION) .
