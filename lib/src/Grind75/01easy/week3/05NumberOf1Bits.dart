import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var n = BigInt.from(00000000000000000000000000001011);
    // n = BigInt.from(00000000000000000000000010000000);
    // n = BigInt.parse('11111111111111111111111111111101');
    var n = Uint32List.fromList([00010110]);
    var result = hammingWeight(n);
    final data = jsonEncode(result);
    return Text(data);
  }
}

int hammingWeight(Uint32List n) {
  //
  int setBitCount = 0;

  while (n != 0) {
    n = n & n - BigInt.one; // to clear the right most set bit
    ++setBitCount;
  }

  return setBitCount;
}
