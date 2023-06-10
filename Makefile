CTR ?= kubeflow-dev
IMG ?= kimwnasptd/kubeflow-dev
TAG ?= $(shell git describe --tags --always --dirty)

kubeflow-dev-build:
	docker buildx build --platform linux/amd64 -f dev-container/Dockerfile . -t ${IMG}:${TAG}

kubeflow-dev-stop:
	docker container stop ${CTR}

kubeflow-dev-rm:
	docker container rm ${CTR}

kubeflow-dev-exec:
	docker exec -ti ${CTR} /bin/bash

kubeflow-dev-run:
	docker run -ti \
		--platform linux/amd64 \
		--name ${CTR} \
		--hostname kubeflow \
		--privileged \
		--detach \
		-w /root \
		-v ${HOME}/Code:/root/Code \
		-v ${HOME}/.ssh:/root/.ssh \
		${IMG}:${TAG}

