APP_VERSION    	:= 0.0.1
IMAGE_REGISTRY 	:= $(ECR_REPOSITORY)
APP_NAME  	?= morse-responder
IMAGE_NAME     	:= $(APP_NAME)

EXECUTABLE      := $(APP_NAME)
IMAGE_FULL_NAME := $(if $(IMAGE_REGISTRY), $(IMAGE_REGISTRY)/$(IMAGE_NAME), $(IMAGE_NAME))

DOCKER		:= podman # docker

.PHONY: clean all build-image # push-image

all: $(EXECUTABLE)

$(EXECUTABLE): morse-responder.go
	cd morse-responder; \\
	go build -o $(EXECUTABLE) -ldflags="-X main.APP_VERSION=$(APP_VERSION)" $<

build-image:
	$(DOCKER) build --rm --no-cache -t $(IMAGE_FULL_NAME):$(APP_VERSION) .

# push-image: build-image
# 	$(DOCKER) push $(IMAGE_FULL_NAME):$(APP_VERSION)

clean:
	rm -rf $(EXECUTABLE)
