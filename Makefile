CTR ?= kubeflow-dev
IMG ?= kimwnasptd/kubeflow-dev
TAG ?= $(shell git describe --tags --always --dirty)

kubeflow-dev-build:
	docker buildx build --platform linux/amd64 -f dev-container/Dockerfile . -t ${IMG}:${TAG}

kubeflow-dev-stop:
	docker container remove ${CTR}

kubeflow-dev-run:
	docker run -ti \
		--platform linux/amd64 \
		--name ${CTR} \
		--hostname kubeflow \
		-p 8080:8080 \
		--entrypoint /bin/bash \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v ${HOME}/Code:/root/Code \
		-v ${HOME}/.ssh:/root/.ssh \
		-w /root \
		${IMG}:${TAG}

