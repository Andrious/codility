import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var A = [1, 3, 1, 4, 2, 3, 5, 4];
    A = [1, 1, 2, 5, 3, 4, 3];
    var result = solution(4, A);
    final data = jsonEncode(result);
    return Text(data);
  }
}

/// Is there a permutation?
int solution(int X, List<int> A) {
  // Take advantage of the Set property of 'no duplicates'
  final values = <int>{};
  for (int i = 0; i < A.length; i++) {
    // Doesn't add if already there
    if (values.add(A[i])) {
      X--;
    }
    // Return the 'last' index of the array up to X iterations
    if (X == 0) {
      return i;
    }
  }
  return -1;
}
