from coinsupport.coins import GRLC, TGRLC, TUX


GRLC['database'] = { 'name': 'grlc' }
GRLC['coindaemon']['hostname'] = 'garlicoind'
GRLC['allow_tx_subsidy'] = True

TGRLC['database'] = { 'name': 'tgrlc' }
TGRLC['coindaemon']['hostname'] = 'garlicoind-testnet'
TGRLC['allow_tx_subsidy'] = False

TUX['database'] = { 'name': 'tux' }
TUX['coindaemon']['hostname'] = 'tuxcoind'
TUX['allow_tx_subsidy'] = False


KEYSEEDER = {
    'name':                 'Keyseeder',
    'ticker':               None,
    'database':             None,
    'coindaemon': {
        'hostname':         'keyseeder',
        'port':             GRLC['coindaemon']['port']
    },
    'address_version':      GRLC['address_version'],
    'p2sh_address_version': GRLC['p2sh_address_version'],
    'privkey_version':      GRLC['privkey_version'],
    'segwit_info':          None,
    'allow_tx_subsidy':     False
}


DATABASE_PROTOCOL   = 'mysql+pymysql'
DATABASE_HOST       = 'mariadb'
DATABASE_WALLET_DB  = 'wallets'

from config_private import ENCRYPTION_KEY, DATABASE_CREDENTIALS, COINDAEMON_CREDENTIALS, KEYSEEDER_CREDENTIALS


COINS = [ GRLC, TUX, TGRLC ]


API_ENDPOINT = 'https://api.freshgrlc.net/wallet'
INDEXER_API_ENDPOINT = 'https://api.freshgrlc.net/blockchain'
INDEXER_ADDRESS_API_PATH = '/address'
INDEXER_TRANSACTION_API_PATH = '/transactions'

