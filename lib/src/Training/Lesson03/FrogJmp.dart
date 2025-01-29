import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../view.dart';

///
/// https://codereview.stackexchange.com/questions/46699/codility-frog-jump-count-minimal-number-of-jumps-from-position-x-to-y
/// You don't need a loop for this, there is a mathematical solution:
///
/// If y - x is divisible by d, then it takes (y - x) / d jumps
/// If y - x is not divisible by d, then it takes (y - x) / d + 1 jumps
///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const X = 10;
    const Y = 85;
    const D = 30;
    var result = solution(X, Y, D);
    final data = jsonEncode(result);
    return Text(data);
  }
}

int solution(int X, int Y, int D) {
  if ((Y - X) % D == 0) {
    return (Y - X) ~/ D;
  }
  return ((Y - X) / D + 1).toInt();
}
