
SUBDIRS = garlicoin-core garlicoin-core-testnet tuxcoin-core

all:
	for dir in ${SUBDIRS}; do ${MAKE} -C $$dir || exit 1; done

clean:
	for dir in ${SUBDIRS}; do ${MAKE} -C $$dir clean || exit 1; done

upload:
	test ! -z "${SERVERS}"
	for dir in ${SUBDIRS}; do for server in ${SERVERS}; do ${MAKE} -C $$dir SERVER=$$server upload || exit 1; done; done
