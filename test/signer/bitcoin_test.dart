import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:test/test.dart';

void main() {
  test('signTransaction encodes a normalized low-S value minimally', () {
    final signer = BitcoinSigner.fromKeyBytes(BytesUtils.fromHexString(
        '72cd6e8422c407fb6d098690f1130b7ded7ec2f7f5e1d30bd9d521f015363793'));
    final signature = signer.signTransaction(BytesUtils.fromHexString(
        '8df001f01a69e30cfc22dbe3206ee1e1ab3e1a3fac57f29a60fe0ff7eaa65d90'));
    expect(
        BytesUtils.toHexString(signature),
        '304302201e170bdace434d4560acdf0762af39a4327fece7d58014fd867c72fe2d0a342b'
        '021f753a85277f2edafd3efd1009cc86ea125fab0bd6a7d29675f29d21d5337c1f');
  });
}
