IMAGE_NAME := ghcr.io/sawanoboly/ghcr-buildx

.PHONY: null

null:
	:

.PHONY: check

check:
	docker pull --platform=linux/amd64 $(IMAGE_NAME):main
	docker image inspect $(IMAGE_NAME):main | jq .[0].Architecture
	docker pull --platform=linux/arm64 $(IMAGE_NAME):main
	docker image inspect $(IMAGE_NAME):main | jq .[0].Architecture
	docker image rm $(IMAGE_NAME):main
	docker image prune -f
