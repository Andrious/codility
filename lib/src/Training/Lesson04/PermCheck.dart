import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // root = [6, 2, 8, 0, 4, 7, 9, null, null, 3, 5];
    // treeNode = createTree(root, 0);
    var result = solution([4, 1, 3, 2]);
    final data = jsonEncode(result);
    return Text(data);
  }
}

/// sum of consecutive integers from 1 to n is equal to n(n+1)~/2.
/// The difference will yield the value of the missing element
/// with n = length + 1;
/// However, to check if permutation at al
/// n == length;
// int solution(List<int> A) {
//   final n = A.length;
//   final result = n * (n + 1) ~/ 2;
//   var sum = 0;
//   for (var e in A) {
//     sum += e;
//   }
//   return result - sum == 0 ? 1 : 0;
// }

int solution(List<int> A) {
  int xorSum = 0;
  for (int i = 0; i < A.length; i++) {
    xorSum = (i + 1) ^ A[i] ^ xorSum;
  }
  return xorSum == 0 ? 1 : 0;
}
