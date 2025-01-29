import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var result = solution([-3, 1, 2, -2, 5, 6]);
    final data = jsonEncode(result);
    return Text(data);
  }
}

int solution(List<int> A) {
  // main idea:
  // max_1 = positive * positive * positive
  // max_2 = negative * negative * positive
  // max = Math.max(max_1, max_1)
  // just need to sort the integer array

  // sort the array
  A.sort();

  // max_1 = 1st biggest * 2nd biggest * 3rd biggest
  final max_1 = A[A.length - 1] * A[A.length - 2] * A[A.length - 3];

  // max_2 = 1st smallest * 2nd smallest * 1st biggest
  final max_2 = A[0] * A[1] * A[A.length - 1];

  // take the maximum
  return math.max(max_1, max_2);
}
