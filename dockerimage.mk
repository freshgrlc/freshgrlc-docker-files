
SNAPSHOT=$(shell date '+%Y%m%d%H%M')

.PHONY: clean docker-build upload ${IMAGENAME}_latest.tar

all: ${IMAGENAME}_latest.tar

clean:
	rm -f ${IMAGENAME}_latest.tar
	rm -f .lastimageid

docker-build: docker-build-depends
	docker image build -t ${IMAGENAME}:latest .

docker-build-depends:

${IMAGENAME}_latest.tar: docker-build
	if [ ! -f $@ ] || [ "$$(docker image ls ${IMAGENAME}:latest | tail -n 1 | awk '{ print $$3 }')" != "$$(cat .lastimageid)" ]; then \
		docker tag ${IMAGENAME}:latest ${IMAGENAME}:${SNAPSHOT}; \
		docker save --output $@ ${IMAGENAME}:${SNAPSHOT} ${IMAGENAME}:latest || exit 1; \
		docker image ls ${IMAGENAME}:${SNAPSHOT} | tail -n 1 | awk '{ print $$3 }' > .lastimageid || exit 1; \
	fi

upload: ${IMAGENAME}_latest.tar
	[ "$$(ssh ${SERVER} md5sum /tmp/$< | awk '{ print $$1 }')" = "$$(md5sum $< | awk '{ print $$1 }')" ] || \
		scp -C $< ${SERVER}:/tmp
	ssh ${SERVER} docker load --input /tmp/$<

