
SUBDIRS = certbot cluster-monitor freshgrlc-indexer freshgrlc-indexer-api freshgrlc-wallet-api frontend-webserver garlicoin-core garlicoin-core-testnet garlicoin-core-keyseeder tuxcoin-core

all:
	for dir in ${SUBDIRS}; do ${MAKE} -C $$dir || exit 1; done

clean:
	for dir in ${SUBDIRS}; do ${MAKE} -C $$dir clean || exit 1; done

upload:
	test ! -z "${SERVER}"
	for dir in ${SUBDIRS}; do ${MAKE} -C $$dir SERVER="${SERVER}" upload || exit 1; done
