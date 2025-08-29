/// A address_encoder liberary for encoding blockchain addresses from public keys.
library;

/// Export statement for Bitcoin Cash address converter.
export 'bch_addr_converter.dart' show BchAddrConverter;

/// Export statement for Ethereum address encoder.
export 'eth_addr.dart' show EthAddrEncoder, EthAddrUtils;

/// Export statement for Nano address encoder.
export 'nano_addr.dart' show NanoAddrEncoder;

/// Export statements for Bitcoin and Bitcoin Cash P2PKH address encoders.
export 'p2pkh_addr.dart' show BchP2PKHAddrEncoder, P2PKHAddrEncoder;

/// Export statements for Bitcoin and Bitcoin Cash P2SH address encoders.
export 'p2sh_addr.dart' show BchP2SHAddrEncoder, P2SHAddrEncoder;

/// Export statement for Taproot (P2TR) address encoder.
export 'p2tr_addr.dart' show P2TRAddrEncoder, P2TRUtils;

/// Export statement for Segregated Witness (P2WPKH) address encoder.
export 'p2wpkh_addr.dart' show P2WPKHAddrEncoder;

/// Export statement for Solana (SOL) address encoder.
export 'sol_addr.dart' show SolAddrEncoder;

/// Export statement for TRON (TRX) address encoder.
export 'trx_addr.dart' show TrxAddrEncoder;

/// Export statements for Monero (XMR) address encoders.
export 'xmr_addr.dart'
    show XmrAddrEncoder, XmrIntegratedAddrEncoder, XmrAddressType;
