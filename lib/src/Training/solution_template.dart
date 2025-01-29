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
  // Implement your solution here
}
