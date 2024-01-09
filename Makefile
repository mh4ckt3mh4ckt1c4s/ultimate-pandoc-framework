CONTAINER_TOOL=podman

all: build, generate

generate-bare:
	pandoc --defaults config/config.yaml

generate:
	$(CONTAINER_TOOL) run --rm \
		--volume "$(shell pwd):/host" \
		localhost/ultimate-pandoc-template-builder --defaults config/config.yaml

build:
	$(CONTAINER_TOOL) build -t localhost/ultimate-pandoc-template-builder -f Containerfile

