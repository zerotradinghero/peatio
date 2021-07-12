Peatio::Wallet.registry[:bitcoind] = Bitcoin::Wallet
Peatio::Wallet.registry[:geth] = Ethereum::Wallet
Peatio::Wallet.registry[:parity] = Ethereum::Wallet
Peatio::Wallet.registry[:opendax_cloud] = OpendaxCloud::Wallet
Peatio::Wallet.registry[:old_bitcoin] = OldBitcoin::Wallet
