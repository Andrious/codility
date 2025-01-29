import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/number-of-1-bits/
///
/// Write a function that takes the binary representation of an unsigned integer and
/// returns the number of '1' bits it has (also known as the Hamming weight).
///
/// Note:
///
/// Note that in some languages, such as Java, there is no unsigned integer type.
/// In this case, the input will be given as a signed integer type.
/// It should not affect your implementation, as the integer's internal binary representation
/// is the same, whether it is signed or unsigned.
/// In Java, the compiler represents the signed integers using 2's complement notation.
/// Therefore, in Example 3, the input represents the signed integer. -3.
///
///
/// Example 1:
///
/// Input: n = 00000000000000000000000000001011
/// Output: 3
/// Explanation:
/// The input binary string has a total of three '1' bits.
///
/// Example 2:
///
/// Input: n = 00000000000000000000000010000000
/// Output: 1
/// Explanation:
/// The input binary string has a total of one '1' bit.
///
/// Example 3:
///
/// Input: n = 11111111111111111111111111111101
/// Output: 31
/// Explanation:
/// The input binary string has a total of thirty one '1' bits.
///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var n = BigInt.from(00000000000000000000000000001011);
    // n = BigInt.from(00000000000000000000000010000000);
    // n = BigInt.parse('11111111111111111111111111111101');
//    var n = Uint32List.fromList([00010110]);
    var result = hammingWeight(n);
    final data = jsonEncode(result);
    return Text(data);
  }
}

int hammingWeight(BigInt n) {
  //
  int setBitCount = 0;

  while (n != 0) {
    n = n & n - BigInt.one; // to clear the right most set bit
    ++setBitCount;
  }

  return setBitCount;
}
