
SUBDIRS = freshgrlc-indexer garlicoin-core garlicoin-core-testnet tuxcoin-core

all:
	for dir in ${SUBDIRS}; do ${MAKE} -C $$dir || exit 1; done

clean:
	for dir in ${SUBDIRS}; do ${MAKE} -C $$dir clean || exit 1; done

upload:
	test ! -z "${SERVER}"
	for dir in ${SUBDIRS}; do ${MAKE} -C $$dir SERVER="${SERVER}" upload || exit 1; done
