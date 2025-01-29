import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  /// Given the range or 6 to 11,
  /// return the number of integer within that range
  /// divisible by 2
  @override
  Widget build(BuildContext context) {
    // 6, 11, 2 should return 3
    var result = solution(6, 11, 2);
    final data = jsonEncode(result);
    return Text(data);
  }
}

int solution(int A, int B, int K) {
  // write your code in Java SE 8

  // need to achieve low complexity O(1)
  // using math equation (low complexity)

  // number of divisible values smaller than B
  var numB = (B / K).floor();
  // note: take "Math.floor" which is the basic number

  // number of divisible values smaller than A
  var numA = (A / K).floor();

  // note: take "Math.floor" which is the basic number

  // number of divisible numbers
  var numDiv = numB - numA;

  // note: plus one (if A % K == 0)
  // because "A" is also divisible
  // without "plus", "A" will be deducted
  int plus = 0;
  if (A % K == 0) plus = 1;

  // num_div + plus
  numDiv = numDiv + plus;

  // return the number of K-divisible values between A and B
  return numDiv;
}
