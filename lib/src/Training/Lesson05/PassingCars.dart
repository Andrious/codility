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
    var result = solution();
    final data = jsonEncode(result);
    return Text(data);
  }
}

int solution(List<int> A) {
  int zeros = 0;
  int carPasses = 0;

  for (int i = 0; i < A.length; i++) {
    if (A[i] == 0) {
      zeros++;
      //for every 1 - there will be an extra car pass for ALL the 0's that came before it
    } else {
      carPasses += zeros;
      if (carPasses > 1000000000) {
        return -1;
      }
    }
  }
  return carPasses;
}
