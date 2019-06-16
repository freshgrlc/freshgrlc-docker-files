
SOURCE_TAG=$(shell [ ! -z "${IMAGESOURCE}" ] && docker image ls ${IMAGESOURCE} | grep -v REPOSITORY | grep -v latest | head -n1 | awk '{ print $$2 }')
BUILD_TAG=$(shell echo ${SOURCE_TAG} $(shell date -u '+%Y%m%d%H%M') | awk '{ print $$1 }')

.PHONY: clean docker-build upload ${IMAGENAME}_latest.tar

all: docker-build

clean:

docker-build: docker-build-depends
	docker image build -t ${IMAGENAME}:${BUILD_TAG} .
	docker tag ${IMAGENAME}:${BUILD_TAG} ${IMAGENAME}:latest

docker-build-depends:

upload: docker-build
	for tag in $(shell docker image ls ${IMAGENAME} | grep -v REPOSITORY | awk '{ print $$2 }'); do \
		docker tag ${IMAGENAME}:$$tag ${SERVER}:5000/${IMAGENAME}:$$tag || exit 1; \
		docker push ${SERVER}:5000/${IMAGENAME}:$$tag || exit 1; \
		[ "$$tag" = "latest" ] || docker image rm ${IMAGENAME}:$$tag ${SERVER}:5000/${IMAGENAME}:$$tag; \
	done
