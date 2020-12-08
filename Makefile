default: docker

DOCKER_IMAGE ?= jmatiastw/version-server
DOCKER_TAG ?= 0.2
VCS_REF ?= $(DOCKER_TAG)

docker:
	docker build  -t $(DOCKER_IMAGE):$(DOCKER_TAG) -t $(DOCKER_IMAGE):latest  .

docker-push: docker
	# Push to DockerHub
	docker push $(DOCKER_IMAGE):$(DOCKER_TAG)
	docker push $(DOCKER_IMAGE):latest