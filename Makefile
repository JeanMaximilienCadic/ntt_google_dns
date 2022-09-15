# PHONY are targets with no files to check, all in our case
.DEFAULT_GOAL := help

ORG=cadic
PACKAGE_NAME=google_dns
IMAGE=$(ORG)/$(PACKAGE_NAME)

# Makefile for launching common tasks
DOCKER_OPTS ?= \
	--restart unless-stopped \
    -v /opt/google_dns:/opt/google_dns \
	--network=host

help:
	@echo "Usage: make {build,  bash, ...}"
	@echo "Please check README.md for instructions"
	@echo ""


# BUILD DOCKER
build_dockers: build_docker

build_docker:
	docker build . -t  $(IMAGE) --network host -f docker/Dockerfile

# PUSH
push_dockers: push_docker

push_docker:
	docker push $(IMAGE_SANDBOX)

# PULL
pull_dockers: pull_docker

pull_docker:
	docker pull $(IMAGE)

# DOCKER RUNs
docker_run:
	@docker stop dev_$(PACKAGE_NAME) || true
	@docker rm dev_$(PACKAGE_NAME) || true
	docker run --name dev_$(PACKAGE_NAME) ${DOCKER_OPTS} -dt $(IMAGE)

checkout:
	# Update git
	@git checkout -b dev || true; \
		git add .; git commit -m "ack"; \
		git push origin dev

# ALL
all: build checkout push_dockers
all_branch: build_wheels checkout
