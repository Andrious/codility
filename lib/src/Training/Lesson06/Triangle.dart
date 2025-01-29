import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var result = solution([10, 2, 5, 1, 8, 20]);
    final data = jsonEncode(result);
    return Text(data);
  }
}

int solution(List<int> A) {
  int p, q, r;
  if (A.length > 2) {
    A.sort();
    for (var i = -1; ++i < A.length - 2;) {
      p = A[i];
      q = A[i + 1];
      r = A[i + 2];
      // A triplet (P, Q, R) is triangular if 0 ≤ P < Q < R < N
      if (q + r > p && r + p > q && p + q > r) return 1;
    }
  }
  return 0;
}
