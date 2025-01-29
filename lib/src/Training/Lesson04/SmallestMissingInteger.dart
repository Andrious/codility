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
    var result = solution([1, 3, 6, 4, 1, 2]);
    final data = jsonEncode(result);
    return Text(data);
  }
}

int solution(List<int> A) {
  Set<int> set = {};
  for (final a in A) {
    if (a > 0) {
      set.add(a);
    }
  }

  var minNum = 1;
  while (set.contains(minNum)) {
    minNum++;
  }

  return minNum;
}
