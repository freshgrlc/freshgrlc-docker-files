
IMAGENAME=tuxcoind

.PHONY: ${IMAGENAME}_latest.tar

all: ${IMAGENAME}_latest.tar

clean:
	rm -f ${IMAGENAME}_latest.tar
	rm -f .lastimageid

${IMAGENAME}_latest.tar:
	docker image build -t ${IMAGENAME} .
	if [ ! -f $@ ] || [ "$$(docker image ls ${IMAGENAME}:latest | tail -n 1 | awk '{ print $$3 }')" != "$$(cat .lastimageid)" ]; then \
		docker save --output $@ ${IMAGENAME}:latest || exit 1; \
		docker image ls ${IMAGENAME}:latest | tail -n 1 | awk '{ print $$3 }' > .lastimageid || exit 1; \
	fi

upload: ${IMAGENAME}_latest.tar
	scp $< ${SERVER}:/tmp
	ssh ${SERVER} docker load --input /tmp/$<
	ssh ${SERVER} rm -f /tmp/$<

