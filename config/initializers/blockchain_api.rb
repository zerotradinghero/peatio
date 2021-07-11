Peatio::Blockchain.registry[:bitcoin] = Bitcoin::Blockchain
Peatio::Blockchain.registry[:geth] = Ethereum::Blockchain
Peatio::Blockchain.registry[:parity] = Ethereum::Blockchain
Peatio::Blockchain.registry[:"geth-bsc"] = Ethereum::Bsc::Blockchain
Peatio::Blockchain.registry[:"geth-heco"] = Ethereum::Heco::Blockchain
Peatio::Blockchain.registry[:old_bitcoin] = OldBitcoin::Blockchain
