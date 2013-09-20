authorizeNet {
    testMode = false
    duplicateWindow = '120'  //Default is 120 (2 minutes)
    delimiter = ';'
}

environments {
    development {
        authorizeNet {
            login = '6pKhTc8S9PC'
            transactionKey = '8W3jsZ8U8k7b3ZhY'
            urlString = 'https://test.authorize.net/gateway/transact.dll'
        }
    }
}

