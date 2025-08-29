import 'package:blockchain_utils/bip/address/encoders.dart';
import 'package:blockchain_utils/bip/bip/bip32/bip32_const.dart';
import 'package:blockchain_utils/bip/bip/bip32/bip32_key_net_ver.dart';
import 'package:blockchain_utils/bip/bip/conf/config/bip_bitcoin_cash_conf.dart';
import 'package:blockchain_utils/bip/bip/conf/config/bip_coin_conf.dart';
import 'package:blockchain_utils/bip/bip/conf/const/bip_conf_const.dart';
import 'package:blockchain_utils/bip/bip/conf/config/bip_litecoin_conf.dart';
import 'package:blockchain_utils/bip/bip/conf/core/coin_conf.dart';
import 'package:blockchain_utils/bip/coin_conf/constant/coins_conf.dart';
import 'package:blockchain_utils/bip/ecc/curve/elliptic_curve_types.dart';
import 'package:blockchain_utils/bip/slip/slip44/slip44.dart';

/// A configuration class for BIP44 coins that defines the key network versions and
/// maps each supported BIP44Coin to its corresponding BipCoinConfig.
class Bip44Conf {
  /// The key network version for the mainnet of Bitcoin.
  static final Bip32KeyNetVersions bip44BtcKeyNetVerMain =
      Bip32Const.mainNetKeyNetVersions;

  /// The key network version for the testnet of Bitcoin.
  static final Bip32KeyNetVersions bip44BtcKeyNetVerTest =
      Bip32Const.testNetKeyNetVersions;

  /// Configuration for Avax C-Chain
  static final BipCoinConfig avaxCChain = BipCoinConfig(
    coinNames: CoinsConf.avaxCChain.coinName,
    coinIdx: Slip44.ethereum,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => EthAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Binance Smart Chain
  static final BipCoinConfig binanceSmartChain = BipCoinConfig(
    coinNames: CoinsConf.binanceSmartChain.coinName,
    coinIdx: Slip44.ethereum,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => EthAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Bitcoin main net
  static final BipCoinConfig bitcoinMainNet = BipCoinConfig(
    coinNames: CoinsConf.bitcoinMainNet.coinName,
    coinIdx: Slip44.bitcoin,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: CoinsConf.bitcoinMainNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => P2PKHAddrEncoder(),
    addrParams: {
      "net_ver": CoinsConf.bitcoinMainNet.params.p2pkhNetVer!,
    },
  );

  /// Configuration for Bitcoin test net
  static final BipCoinConfig bitcoinTestNet = BipCoinConfig(
    coinNames: CoinsConf.bitcoinTestNet.coinName,
    coinIdx: Slip44.testnet,
    chainType: ChainType.testnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerTest,
    wifNetVer: CoinsConf.bitcoinTestNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => P2PKHAddrEncoder(),
    addrParams: {
      "net_ver": CoinsConf.bitcoinTestNet.params.p2pkhNetVer,
    },
  );

  /// Configuration for Bitcoin Cash main net
  static final BipBitcoinCashConf bitcoinCashMainNet = BipBitcoinCashConf(
    coinNames: CoinsConf.bitcoinCashMainNet.coinName,
    coinIdx: Slip44.bitcoinCash,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: CoinsConf.bitcoinCashMainNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic legacy]) {
      if (legacy == true) {
        return P2PKHAddrEncoder();
      }
      return BchP2PKHAddrEncoder();
    },
    addrParams: {
      "std": {
        "net_ver": CoinsConf.bitcoinCashMainNet.params.p2pkhStdNetVer!,
        "hrp": CoinsConf.bitcoinCashMainNet.params.p2pkhStdHrp!,
      },
      "legacy": {
        "net_ver": CoinsConf.bitcoinCashMainNet.params.p2pkhLegacyNetVer!,
      }
    },
  );

  /// Configuration for Bitcoin Cash test net
  static final BipBitcoinCashConf bitcoinCashTestNet = BipBitcoinCashConf(
    coinNames: CoinsConf.bitcoinCashTestNet.coinName,
    coinIdx: Slip44.testnet,
    chainType: ChainType.testnet,
    defPath: derPathNonHardenedFull,
    addressEncoder: ([dynamic legacy]) {
      if (legacy == true) {
        return P2PKHAddrEncoder();
      }
      return BchP2PKHAddrEncoder();
    },
    keyNetVer: bip44BtcKeyNetVerTest,
    wifNetVer: CoinsConf.bitcoinCashTestNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addrParams: {
      "std": {
        "net_ver": CoinsConf.bitcoinCashTestNet.params.p2pkhStdNetVer!,
        "hrp": CoinsConf.bitcoinCashTestNet.params.p2pkhStdHrp!,
      },
      "legacy": {
        "net_ver": CoinsConf.bitcoinCashTestNet.params.p2pkhLegacyNetVer!,
      }
    },
  );

  /// Configuration for Bitcoin Cash Simple Ledger Protocol main net
  static final BipBitcoinCashConf bitcoinCashSlpMainNet = BipBitcoinCashConf(
    coinNames: CoinsConf.bitcoinCashSlpMainNet.coinName,
    coinIdx: Slip44.bitcoinCash,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: CoinsConf.bitcoinCashSlpMainNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic legacy]) {
      if (legacy == true) {
        return P2PKHAddrEncoder();
      }
      return BchP2PKHAddrEncoder();
    },
    addrParams: {
      "std": {
        "net_ver": CoinsConf.bitcoinCashSlpMainNet.params.p2pkhStdNetVer,
        "hrp": CoinsConf.bitcoinCashSlpMainNet.params.p2pkhStdHrp,
      },
      "legacy": {
        "net_ver": CoinsConf.bitcoinCashSlpMainNet.params.p2pkhLegacyNetVer!,
      }
    },
  );

  /// Configuration for Bitcoin Cash Simple Ledger Protocol test net
  static final BipBitcoinCashConf bitcoinCashSlpTestNet = BipBitcoinCashConf(
    coinNames: CoinsConf.bitcoinCashSlpTestNet.coinName,
    coinIdx: Slip44.testnet,
    chainType: ChainType.testnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerTest,
    wifNetVer: CoinsConf.bitcoinCashSlpTestNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic legacy]) {
      if (legacy == true) {
        return P2PKHAddrEncoder();
      }
      return BchP2PKHAddrEncoder();
    },
    addrParams: {
      "std": {
        "net_ver": CoinsConf.bitcoinCashSlpTestNet.params.p2pkhStdNetVer!,
        "hrp": CoinsConf.bitcoinCashSlpTestNet.params.p2pkhStdHrp!,
      },
      "legacy": {
        "net_ver": CoinsConf.bitcoinCashSlpTestNet.params.p2pkhLegacyNetVer!,
      }
    },
  );

  /// Configuration for BitcoinSV main net
  static final BipCoinConfig bitcoinSvMainNet = BipCoinConfig(
    coinNames: CoinsConf.bitcoinSvMainNet.coinName,
    coinIdx: Slip44.bitcoinSv,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: CoinsConf.bitcoinSvMainNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic legacy]) {
      return P2PKHAddrEncoder();
    },
    addrParams: {
      "net_ver": CoinsConf.bitcoinSvMainNet.params.p2pkhNetVer!,
    },
  );

  /// Configuration for BitcoinSV test net
  static final BipCoinConfig bitcoinSvTestNet = BipCoinConfig(
    coinNames: CoinsConf.bitcoinSvTestNet.coinName,
    coinIdx: Slip44.testnet,
    chainType: ChainType.testnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerTest,
    wifNetVer: CoinsConf.bitcoinSvTestNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => P2PKHAddrEncoder(),
    addrParams: {
      "net_ver": CoinsConf.bitcoinSvTestNet.params.p2pkhNetVer!,
    },
  );

  /// Configuration for Celo
  static final BipCoinConfig celo = BipCoinConfig(
    coinNames: CoinsConf.celo.coinName,
    coinIdx: Slip44.celo,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => EthAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Dash main net
  static final BipCoinConfig dashMainNet = BipCoinConfig(
    coinNames: CoinsConf.dashMainNet.coinName,
    coinIdx: Slip44.dash,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: CoinsConf.dashMainNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => P2PKHAddrEncoder(),
    addrParams: {
      "net_ver": CoinsConf.dashMainNet.params.p2pkhNetVer!,
    },
  );

  /// Configuration for Dash test net
  static final BipCoinConfig dashTestNet = BipCoinConfig(
    coinNames: CoinsConf.dashTestNet.coinName,
    coinIdx: Slip44.testnet,
    chainType: ChainType.testnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerTest,
    wifNetVer: CoinsConf.dashTestNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => P2PKHAddrEncoder(),
    addrParams: {
      "net_ver": CoinsConf.dashTestNet.params.p2pkhNetVer!,
    },
  );

  /// Configuration for Dogecoin main net
  static final BipCoinConfig dogecoinMainNet = BipCoinConfig(
    coinNames: CoinsConf.dogecoinMainNet.coinName,
    coinIdx: Slip44.dogecoin,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: Bip32KeyNetVersions(List<int>.from([0x02, 0xfa, 0xca, 0xfd]),
        List<int>.from([0x02, 0xfa, 0xc3, 0x98])),
    wifNetVer: CoinsConf.dogecoinMainNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => P2PKHAddrEncoder(),
    addrParams: {
      "net_ver": CoinsConf.dogecoinMainNet.params.p2pkhNetVer!,
    },
  );

  /// Configuration for Dogecoin test net
  static final BipCoinConfig dogecoinTestNet = BipCoinConfig(
    coinNames: CoinsConf.dogecoinTestNet.coinName,
    coinIdx: Slip44.testnet,
    chainType: ChainType.testnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: Bip32KeyNetVersions(List<int>.from([0x04, 0x32, 0xa9, 0xa8]),
        List<int>.from([0x04, 0x32, 0xa2, 0x43])),
    wifNetVer: CoinsConf.dogecoinTestNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => P2PKHAddrEncoder(),
    addrParams: {
      "net_ver": CoinsConf.dogecoinTestNet.params.p2pkhNetVer!,
    },
  );

  /// Configuration for Pepecoin main net
  static final BipCoinConfig pepeMainnet = BipCoinConfig(
    coinNames: CoinsConf.pepeMainnet.coinName,
    coinIdx: Slip44.pepecoin,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: Bip32KeyNetVersions(List<int>.from([0x02, 0xfa, 0xca, 0xfd]),
        List<int>.from([0x02, 0xfa, 0xc3, 0x98])),
    wifNetVer: CoinsConf.pepeMainnet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => P2PKHAddrEncoder(),
    addrParams: {"net_ver": CoinsConf.pepeMainnet.params.p2pkhNetVer!},
  );

  /// Configuration for Pepecoin test net
  static final BipCoinConfig pepeTestnet = BipCoinConfig(
    coinNames: CoinsConf.pepeTestnet.coinName,
    coinIdx: Slip44.testnet,
    chainType: ChainType.testnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: Bip32KeyNetVersions(List<int>.from([0x04, 0x32, 0xa9, 0xa8]),
        List<int>.from([0x04, 0x32, 0xa2, 0x43])),
    wifNetVer: CoinsConf.pepeTestnet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => P2PKHAddrEncoder(),
    addrParams: {"net_ver": CoinsConf.pepeTestnet.params.p2pkhNetVer!},
  );

  /// Configuration for eCash main net
  static final BipBitcoinCashConf ecashMainNet = BipBitcoinCashConf(
    coinNames: CoinsConf.ecashMainNet.coinName,
    coinIdx: Slip44.bitcoinCash,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: CoinsConf.ecashMainNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic legacy]) {
      if (legacy == true) {
        return P2PKHAddrEncoder();
      }
      return BchP2PKHAddrEncoder();
    },
    addrParams: {
      "std": {
        "net_ver": CoinsConf.ecashMainNet.params.p2pkhStdNetVer!,
        "hrp": CoinsConf.ecashMainNet.params.p2pkhStdHrp!,
      },
      "legacy": {
        "net_ver": CoinsConf.ecashMainNet.params.p2pkhLegacyNetVer!,
      },
    },
  );

  /// Configuration for eCash test net
  static final BipBitcoinCashConf ecashTestNet = BipBitcoinCashConf(
    coinNames: CoinsConf.ecashTestNet.coinName,
    coinIdx: Slip44.testnet,
    chainType: ChainType.testnet,
    addressEncoder: ([dynamic legacy]) {
      if (legacy == true) {
        return P2PKHAddrEncoder();
      }
      return BchP2PKHAddrEncoder();
    },
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerTest,
    wifNetVer: CoinsConf.ecashTestNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addrParams: {
      "std": {
        "net_ver": CoinsConf.ecashTestNet.params.p2pkhStdNetVer!,
        "hrp": CoinsConf.ecashTestNet.params.p2pkhStdHrp!,
      },
      "legacy": {
        "net_ver": CoinsConf.ecashTestNet.params.p2pkhLegacyNetVer!,
      },
    },

    /// addrClsLegacy: P2PKHAddrEncoder,
  );

  /// Configuration for Ethereum
  static final BipCoinConfig ethereum = BipCoinConfig(
    coinNames: CoinsConf.ethereum.coinName,
    coinIdx: Slip44.ethereum,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => EthAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for EthereumTestnet
  static final BipCoinConfig ethereumTestnet = BipCoinConfig(
    coinNames: CoinsConf.ethereum.coinName,
    coinIdx: Slip44.testnet,
    chainType: ChainType.testnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => EthAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Ethereum Classic
  static final BipCoinConfig ethereumClassic = BipCoinConfig(
    coinNames: CoinsConf.ethereumClassic.coinName,
    coinIdx: Slip44.ethereumClassic,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => EthAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Fantom Opera
  static final BipCoinConfig fantomOpera = BipCoinConfig(
    coinNames: CoinsConf.fantomOpera.coinName,
    coinIdx: Slip44.ethereum,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => EthAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Harmony One (Metamask address)
  static final BipCoinConfig harmonyOneMetamask = BipCoinConfig(
    coinNames: CoinsConf.harmonyOne.coinName,
    coinIdx: Slip44.ethereum,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => EthAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Harmony One (Ethereum address)
  static final BipCoinConfig harmonyOneEth = BipCoinConfig(
    coinNames: CoinsConf.harmonyOne.coinName,
    coinIdx: Slip44.harmonyOne,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => EthAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Huobi Chain
  static final BipCoinConfig huobiChain = BipCoinConfig(
    coinNames: CoinsConf.huobiChain.coinName,
    coinIdx: Slip44.ethereum,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => EthAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Litecoin main net
  static final BipLitecoinConf litecoinMainNet = BipLitecoinConf(
    coinNames: CoinsConf.litecoinMainNet.coinName,
    coinIdx: Slip44.litecoin,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    addressEncoder: ([dynamic kwargs]) => P2PKHAddrEncoder(),
    altKeyNetVer: Bip32KeyNetVersions(
      List<int>.from([0x01, 0x9d, 0xa4, 0x62]),
      List<int>.from([0x01, 0x9d, 0x9c, 0xfe]),
    ),
    wifNetVer: CoinsConf.litecoinMainNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addrParams: {
      "std_net_ver": CoinsConf.litecoinMainNet.params.p2pkhStdNetVer!,
      "depr_net_ver": CoinsConf.litecoinMainNet.params.p2pkhDeprNetVer,
    },
  );

  /// Configuration for Litecoin test net
  static final BipLitecoinConf litecoinTestNet = BipLitecoinConf(
    coinNames: CoinsConf.litecoinTestNet.coinName,
    coinIdx: Slip44.testnet,
    chainType: ChainType.testnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: Bip32KeyNetVersions(
      List<int>.from([0x04, 0x36, 0xf6, 0xe1]),
      List<int>.from([0x04, 0x36, 0xef, 0x7d]),
    ),
    altKeyNetVer: Bip32KeyNetVersions(
      List<int>.from([0x04, 0x36, 0xf6, 0xe1]),
      List<int>.from([0x04, 0x36, 0xef, 0x7d]),
    ),
    wifNetVer: CoinsConf.litecoinTestNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => P2PKHAddrEncoder(),
    addrParams: {
      "std_net_ver": CoinsConf.litecoinTestNet.params.p2pkhStdNetVer!,
      "depr_net_ver": CoinsConf.litecoinTestNet.params.p2pkhDeprNetVer!,
    },
  );

  /// Configuration for Monero (ed25519 SLIP-0010)
  static final BipCoinConfig moneroEd25519Slip = BipCoinConfig(
    coinNames: CoinsConf.moneroMainNet.coinName,
    coinIdx: Slip44.monero,
    chainType: ChainType.mainnet,
    defPath: derPathHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.ed25519,
    addressEncoder: ([dynamic kwargs]) => XmrAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Monero (secp256k1)
  static final BipCoinConfig moneroSecp256k1 = BipCoinConfig(
    coinNames: CoinsConf.moneroMainNet.coinName,
    coinIdx: Slip44.monero,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => XmrAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Nano
  static final BipCoinConfig nano = BipCoinConfig(
    coinNames: CoinsConf.nano.coinName,
    coinIdx: Slip44.nano,
    chainType: ChainType.mainnet,
    defPath: derPathHardenedShort,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.ed25519Blake2b,
    addressEncoder: ([dynamic kwargs]) => NanoAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Nine Chronicles Gold
  static final BipCoinConfig nineChroniclesGold = BipCoinConfig(
    coinNames: CoinsConf.nineChroniclesGold.coinName,
    coinIdx: Slip44.nineChronicles,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => EthAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for OKEx Chain (Ethereum address)
  static final BipCoinConfig okexChainEth = BipCoinConfig(
    coinNames: CoinsConf.okexChain.coinName,
    coinIdx: Slip44.ethereum,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => EthAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Polygon
  static final BipCoinConfig polygon = BipCoinConfig(
    coinNames: CoinsConf.polygon.coinName,
    coinIdx: Slip44.ethereum,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => EthAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Solana
  static final BipCoinConfig solana = BipCoinConfig(
    coinNames: CoinsConf.solana.coinName,
    coinIdx: Slip44.solana,
    chainType: ChainType.mainnet,
    defPath: derPathHardenedShort,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.ed25519,
    addressEncoder: ([dynamic kwargs]) => SolAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Solana
  static final BipCoinConfig solanaTestnet = BipCoinConfig(
    coinNames: CoinsConf.solana.coinName,
    coinIdx: Slip44.testnet,
    chainType: ChainType.testnet,
    defPath: derPathHardenedShort,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.ed25519,
    addressEncoder: ([dynamic kwargs]) => SolAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Theta
  static final BipCoinConfig theta = BipCoinConfig(
    coinNames: CoinsConf.theta.coinName,
    coinIdx: Slip44.theta,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => EthAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Tron
  static final BipCoinConfig tron = BipCoinConfig(
    coinNames: CoinsConf.tron.coinName,
    coinIdx: Slip44.tron,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => TrxAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Tron testnet
  static final BipCoinConfig tronTestnet = BipCoinConfig(
    coinNames: CoinsConf.tron.coinName,
    coinIdx: Slip44.testnet,
    chainType: ChainType.testnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => TrxAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for VeChain
  static final BipCoinConfig vechain = BipCoinConfig(
    coinNames: CoinsConf.veChain.coinName,
    coinIdx: Slip44.vechain,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: null,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => EthAddrEncoder(),
    addrParams: {},
  );

  /// Configuration for Verge
  static final BipCoinConfig verge = BipCoinConfig(
    coinNames: CoinsConf.verge.coinName,
    coinIdx: Slip44.verge,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: CoinsConf.verge.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => P2PKHAddrEncoder(),
    addrParams: {
      "net_ver": CoinsConf.verge.params.p2pkhNetVer!,
    },
  );

  /// Configuration for Zcash main net
  static final BipCoinConfig zcashMainNet = BipCoinConfig(
    coinNames: CoinsConf.zcashMainNet.coinName,
    coinIdx: Slip44.zcash,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerMain,
    wifNetVer: CoinsConf.zcashMainNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => P2PKHAddrEncoder(),
    addrParams: {
      "net_ver": CoinsConf.zcashMainNet.params.p2pkhNetVer!,
    },
  );

  /// Configuration for Zcash test net
  static final BipCoinConfig zcashTestNet = BipCoinConfig(
    coinNames: CoinsConf.zcashTestNet.coinName,
    coinIdx: Slip44.testnet,
    chainType: ChainType.testnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: bip44BtcKeyNetVerTest,
    wifNetVer: CoinsConf.zcashTestNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => P2PKHAddrEncoder(),
    addrParams: {
      "net_ver": CoinsConf.zcashTestNet.params.p2pkhNetVer!,
    },
  );


  /// Configuration for Electra Protocol main net
  static final BipCoinConfig electraProtocolMainNet = BipCoinConfig(
    coinNames: CoinsConf.electraProtocolMainNet.coinName,
    coinIdx: Slip44.electraProtocol,
    chainType: ChainType.mainnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: Bip32KeyNetVersions(
      List<int>.from([0x04, 0x88, 0xb2, 0x1e]),
      List<int>.from([0x04, 0x88, 0xad, 0xe4]),
    ),
    wifNetVer: CoinsConf.electraProtocolMainNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => P2PKHAddrEncoder(),
    addrParams: {
      "net_ver": CoinsConf.electraProtocolMainNet.params.p2pkhNetVer!,
    },
  );

  /// Configuration for Electra Protocol test net
  static final BipCoinConfig electraProtocolTestNet = BipCoinConfig(
    coinNames: CoinsConf.electraProtocolTestNet.coinName,
    coinIdx: Slip44.testnet,
    chainType: ChainType.testnet,
    defPath: derPathNonHardenedFull,
    keyNetVer: Bip32KeyNetVersions(
      List<int>.from([0x04, 0x35, 0x87, 0xcf]),
      List<int>.from([0x04, 0x35, 0x83, 0x94]),
    ),
    wifNetVer: CoinsConf.electraProtocolTestNet.params.wifNetVer,
    type: EllipticCurveTypes.secp256k1,
    addressEncoder: ([dynamic kwargs]) => P2PKHAddrEncoder(),
    addrParams: {
      "net_ver": CoinsConf.electraProtocolTestNet.params.p2pkhNetVer!
    },
  );
}
