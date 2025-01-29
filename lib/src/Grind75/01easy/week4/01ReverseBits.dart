import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/reverse-bits/
///
/// Reverse bits of a given 32 bits unsigned integer.
///
/// Note:
///
/// Note that in some languages, such as Java, there is no unsigned integer
/// type. In this case, both input and output will be given as a signed integer type.
/// They should not affect your implementation, as the integer's
/// internal binary representation is the same, whether it is signed or unsigned.
/// In Java, the compiler represents the signed integers using 2's complement notation.
/// Therefore, in Example 2 above, the input represents
/// the signed integer -3 and the output represents the signed integer -1073741825.
///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var num = '00000010100101000001111010011100';
    num = '11111111111111111111111111111101';
    final n = BigInt.parse(num);
    var result = reverseBits(n);
    return Text(num);
    // final data = jsonEncode(result);
    // return Text(data);
  }
}

BigInt reverseBits(BigInt n) {
  var m = BigInt.from(0.toUnsigned(32));
  for (int i = 0; i < 32; i++, n >>= 1) {
    m <<= 1;
    m |= n & BigInt.one;
  }
  return m;
}

BigInt reverseBits02(BigInt n) {
  if (n == BigInt.zero) return BigInt.zero;

  BigInt result = BigInt.zero;
  for (int i = 0; i < 32; i++) {
    result <<= 1;
    if ((n & BigInt.one) == BigInt.one) {
      result = result + BigInt.one;
    }
    n >>= 1;
  }
  return result;
}
