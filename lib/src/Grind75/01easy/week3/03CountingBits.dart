import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
/// Given an integer n, return an array ans of length n + 1 such that
/// for each i (0 <= i <= n), ans[i] is the number of 1's in
/// the binary representation of i.
///
///
/// Example 1:
///
/// Input: n = 2
/// Output: [0,1,1]
/// Explanation:
/// 0 --> 0
/// 1 --> 1
/// 2 --> 10
///
/// Example 2:
///
/// Input: n = 5
/// Output: [0,1,1,2,1,2]
/// Explanation:
/// 0 --> 0
/// 1 --> 1
/// 2 --> 10
/// 3 --> 11
/// 4 --> 100
/// 5 --> 101
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var n = 2;
//    n = 5;
    var result = countBits(n);
    final data = jsonEncode(result);
    return Text(data);
  }
}

// f[i] = f[i / 2] + i % 2
List<int> countBits(int n) {
  final f =
      List.generate(n + 1, (index) => 0); // an array of 0's with length n + 1
  for (int i = 1; i <= n; i++) {
    final shift = i >> 1;
    f[i] = f[i >> 1] + (i % 2);
  }
  return f;
}
