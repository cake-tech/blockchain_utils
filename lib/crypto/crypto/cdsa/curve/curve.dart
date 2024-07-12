import 'package:blockchain_utils/crypto/crypto/cdsa/utils/utils.dart';
import 'package:blockchain_utils/numbers/bigint_utils.dart';
import 'package:blockchain_utils/utils/utils.dart';

/// This class represents a finite field elliptic curve defined over a prime field (Fp).
class CurveFp extends Curve {
  /// Prime field modulus
  CurveFp({required this.p, required this.a, required this.b, required this.h});

  /// Prime field modulus
  @override
  final BigInt p;

  /// Coefficient 'a' in the elliptic curve equation
  @override
  final BigInt a;

  /// Coefficient 'b' in the elliptic curve equation
  final BigInt b;

  /// // Optional cofactor 'h'
  final BigInt? h;

  /// Get the cofactor 'h' value
  BigInt? cofactor() => h;

  /// Check if a given point (x, y) lies on the curve
  bool containsPoint(BigInt x, BigInt y) {
    BigInt leftSide = (y * y - ((x * x + a) * x + b)) % p;

    return leftSide == BigInt.zero;
  }

  /// Check if two CurveFp objects are equal based on their properties
  @override
  operator ==(other) {
    if (other is CurveFp) {
      return (p == other.p && a == other.a && b == other.b && h == other.h);
    }
    return false;
  }

  /// Calculate the hash code of the CurveFp object
  @override
  int get hashCode => p.hashCode ^ a.hashCode ^ b.hashCode ^ h.hashCode;

  /// Get the length of the base point in the curve
  @override
  int get baselen => BigintUtils.orderLen(p);

  @override
  int get verifyingKeyLength => throw UnimplementedError();

  @override
  bool isXCoord(BigInt x) {
    BigInt x_3 = x.modPow(BigInt.from(3), p);
    return ECDSAUtils.jacobi(x_3 + a * x + b, p) != BigInt.from(-1);
  }

  @override
  List<BigInt> liftX(BigInt x) {
    BigInt x_3 = x.modPow(BigInt.from(3), p);
    BigInt v = (x_3 + a * x + b) % p;
    BigInt y = ECDSAUtils.modularSquareRootPrime(v, p);
    return [x, y, BigInt.one];
  }

  @override
  List<BigInt> negate(List<BigInt> p1) {
    BigInt x1 = p1[0];
    BigInt y1 = p1[1];
    BigInt z1 = p1[2];
    return [x1, (p - y1) % p, z1];
  }
}

/// This class represents a twisted Edwards elliptic curve defined over a prime field.
class CurveED extends Curve {
  /// Prime field modulus
  CurveED(
      {required this.p, required this.a, required this.d, required this.h, required BigInt order});

  /// Prime field modulus
  @override
  final BigInt p;

  /// Coefficient 'a' in the twisted Edwards curve equation
  @override
  final BigInt a;

  /// Coefficient 'd' in the twisted Edwards curve equation
  final BigInt d;

  /// Cofactor 'h'
  final BigInt h;

  /// Get the cofactor 'h' value
  BigInt cofactor() => h;

  /// Check if a given point (x, y) lies on the curve
  bool containsPoint(BigInt x, BigInt y) {
    BigInt leftSide = (a * x * x + y * y - BigInt.one - d * x * x * y * y) % p;
    return leftSide == BigInt.zero;
  }

  /// Check if two CurveED objects are equal based on their properties
  @override
  operator ==(other) {
    if (other is CurveED) {
      return (p == other.p && a == other.a && d == other.d && h == other.h);
    }
    return false;
  }

  /// Calculate the hash code of the CurveED object
  @override
  int get hashCode => p.hashCode ^ d.hashCode ^ h.hashCode ^ a.hashCode;

  /// Get the length of the base point in the curve
  @override
  int get baselen => ((p.bitLength + 1 + 7) ~/ 8);

  @override
  int get verifyingKeyLength => baselen;

  @override
  bool isXCoord(BigInt x) {
    throw UnimplementedError();
  }

  @override
  List<BigInt> liftX(BigInt x) {
    throw UnimplementedError();
  }

  @override
  List<BigInt> negate(List<BigInt> p1) {
    throw UnimplementedError();
  }
}

/// This is an abstract base class for elliptic curves.
abstract class Curve {
  /// Prime field modulus
  BigInt get p;

  /// Coefficient 'a' in the elliptic curve equation
  BigInt get a;

  /// Get the length of the base point in the curve
  int get baselen;

  /// Get the length of the verifying key in the curve
  int get verifyingKeyLength;

  bool isXCoord(BigInt x);
  List<BigInt> liftX(BigInt x);
  List<BigInt> negate(List<BigInt> p1);
}
