import 'package:blockchain_utils/bip/address/near_addr.dart';
import 'package:example/test/quick_hex.dart';
import 'package:blockchain_utils/utils/utils.dart';

import 'test_vector.dart' show testVector;

void nearAddressTest() {
  for (final i in testVector) {
    final params = Map<String, dynamic>.from(i["params"]);
    final z = NearAddrEncoder()
        .encodeKey(BytesUtils.fromHexString(i["public"]), params);
    assert(z == i["address"]);
    final decode = NearAddrDecoder().decodeAddr(z, params);
    assert(decode.toHex() == i["decode"]);
  }
}
