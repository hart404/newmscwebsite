authorizeNet {
    testMode = false
    duplicateWindow = '120'  // Default is 120 (2 minutes)
    delimiter = ';'
}

environments {
    development {
        authorizeNet {
            login = '7Z3bBa6H'
            transactionKey = '52EM6fDTa4M57xq7'
            urlString = 'https://secure.authorize.net/gateway/transact.dll'
        }
    }
    production {
        authorizeNet {
            login = '7Z3bBa6H'
            transactionKey = '52EM6fDTa4M57xq7'
            urlString = 'https://secure.authorize.net/gateway/transact.dll'
        }
    }
    prod {
        authorizeNet {
            login = '7Z3bBa6H'
            transactionKey = '52EM6fDTa4M57xq7'
            urlString = 'https://secure.authorize.net/gateway/transact.dll'
        }
    }
    backup {
        authorizeNet {
            login = '7Z3bBa6H'
            transactionKey = '52EM6fDTa4M57xq7'
            urlString = 'https://secure.authorize.net/gateway/transact.dll'
        }
    }
}

