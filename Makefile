-include env_make

ALPINE_VER ?= 3.6
WORDPRESS_VER ?= 4.9
NGINX_VER ?= 1.12
TAG ?= $(WORDPRESS_VER)-nginx-$(NGINX_VER)

REPO = willopez/wordpress

.PHONY: build push release

default: build

build:
	docker build -t $(REPO):$(TAG) --build-arg ALPINE_VER=$(ALPINE_VER) ./

push:
	docker push $(REPO):$(TAG)

release: build push
