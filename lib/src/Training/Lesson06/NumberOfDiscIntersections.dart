import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var result = solution([1, 5, 2, 1, 4, 0]);
    final data = jsonEncode(result);
    return Text(data);
  }
}

// int solution(List<int> A) {
//   int numberOfPairs = 0;
//   const int maxValue = 0x7FFFFFFFFFFFFFFF;
//   for (int J = 0; J < A.length; J++) {
//     int jRadius = A[J];
//     for (int K = J + 1; K < A.length; K++) {
//       int distance = K - J;
//       int kRadius = A[K];
//       if (distance / maxValue <= jRadius / maxValue + kRadius / maxValue) {
//         numberOfPairs += 1;
//       }
//       if (numberOfPairs > 10000000) {
//         numberOfPairs = -1;
//         break;
//       }
//     }
//   }
//   return numberOfPairs;
// }
