IMAGE_NAME := ghcr.io/sawanoboly/ghcr-buildx
TAG_NAME := main

.PHONY: null

null:
	:

.PHONY: check

check:
	docker pull --platform=linux/amd64 $(IMAGE_NAME):$(TAG_NAME)
	docker image inspect $(IMAGE_NAME):$(TAG_NAME) | jq .[0].Architecture
	docker pull --platform=linux/arm64 $(IMAGE_NAME):$(TAG_NAME)
	docker image inspect $(IMAGE_NAME):$(TAG_NAME) | jq .[0].Architecture
	docker image rm $(IMAGE_NAME):$(TAG_NAME)
	docker image prune -f
