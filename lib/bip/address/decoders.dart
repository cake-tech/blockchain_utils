/// AN address_decoder library for decoding blockchain addresses
library;

/// Export statement for Ethereum address decoder.
export 'eth_addr.dart' show EthAddrDecoder, EthAddrUtils;

/// Export statement for Nano address decoder.
export 'nano_addr.dart' show NanoAddrDecoder;

/// Export statements for Bitcoin and Bitcoin Cash P2PKH address decoders.
export 'p2pkh_addr.dart' show BchP2PKHAddrDecoder, P2PKHAddrDecoder;

/// Export statements for Bitcoin and Bitcoin Cash P2SH address decoders.
export 'p2sh_addr.dart' show BchP2SHAddrDecoder, P2SHAddrDecoder;

/// Export statement for Taproot (P2TR) address decoder.
export 'p2tr_addr.dart' show P2TRAddrDecoder, P2TRUtils;

/// Export statement for Segregated Witness (P2WPKH) address decoder.
export 'p2wpkh_addr.dart' show P2WPKHAddrDecoder;

/// Export statement for Solana (SOL) address decoder.
export 'sol_addr.dart' show SolAddrDecoder;

/// Export statement for TRON (TRX) address decoder.
export 'trx_addr.dart' show TrxAddrDecoder;

/// Export statements for Monero (XMR) address decoders.
export 'xmr_addr.dart'
    show XmrAddrDecoder, XmrIntegratedAddrDecoder, XmrAddressType;
