
IMAGENAME=garlicoin-core-base

.PHONY: clean docker-build docker-build-depends

all: docker-build

clean:

docker-build: docker-build-depends
	docker image build -t ${IMAGENAME} .

docker-build-depends:
	${MAKE} -C ../garlicoin-core-source docker-build

