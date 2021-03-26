IMAGE_NAME := $(USER)/os-clients
FNAME := Containerfile
CLIENT_VERSION := interactive-4.6 

all: podman-build podman-test

help:
	@echo "make build - Build and locally tag a new image."
	@echo "make build-force - Use a no-cache build"
	@echo to run: podman run --rm -it -v ~/.kube:/root/.kube:z -v '$$PWD:/workdir:z' $(IMAGE_NAME):$(CLIENT_VERSION)

podman-build:
	podman build -t $(IMAGE_NAME):$(CLIENT_VERSION) --file=$(FNAME) .

podman-build-force:
	podman pull ubi8-minimal
	podman build -t $(IMAGE_NAME):$(CLIENT_VERSION) --file=$(FNAME) --no-cache .

podman-test:
	podman image inspect $(IMAGE_NAME):$(CLIENT_VERSION)
	podman run --rm $(IMAGE_NAME):$(CLIENT_VERSION) help
