import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var result = climbStairs(3);
//    result = climbStairs(0);
    final data = jsonEncode(result);
    return Text(data);
  }
}

/// how many distinct ways
/// it's a fibonacci.
/// the total number of ways
/// is equal to the sum of the total number of ways
/// for the previous two steps.
int climbStairs(int n) {
//  int iter = 0;
  int a = 1, b = 1;
  // n just happens to equal the number of iterations to go through
  while (n-- > 0) {
    a = (b += a) - a; // a = (b = b + a) - a
//    iter++;
  }
  return a;
}
