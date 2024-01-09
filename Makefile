CONTAINER_ENGINE=podman

all: build generate

generate-bare:
	pandoc --defaults config/config.yaml

generate:
	$(CONTAINER_ENGINE) run --rm \
		--volume "$(shell pwd):/host" \
		localhost/ultimate-pandoc-template-builder pandoc --defaults config/config.yaml

build:
	$(CONTAINER_ENGINE) build -t localhost/ultimate-pandoc-template-builder -f Containerfile

