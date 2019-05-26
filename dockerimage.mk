
SNAPSHOT=$(shell date -u '+%Y%m%d%H%M')

.PHONY: clean docker-build upload ${IMAGENAME}_latest.tar

all: docker-build

clean:

docker-build: docker-build-depends
	docker image build -t ${IMAGENAME}:latest .

docker-build-depends:

upload: docker-build
	docker tag ${IMAGENAME}:latest ${SERVER}:5000/${IMAGENAME}:latest
	docker tag ${IMAGENAME}:latest ${SERVER}:5000/${IMAGENAME}:${SNAPSHOT}
	docker push ${SERVER}:5000/${IMAGENAME}:${SNAPSHOT}
	docker push ${SERVER}:5000/${IMAGENAME}:latest

