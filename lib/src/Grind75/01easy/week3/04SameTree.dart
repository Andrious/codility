import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = createTree([1, 2, 3], 0);
    final q = createTree([1, 2, 3], 0);
    var result = isSameTree(p, q);
    final data = jsonEncode(result);
    return Text(data);
  }
}

///
/// Two binary trees are considered the same if they are structurally identical,
/// and the nodes have the same value.
bool isSameTree(TreeNode? a, TreeNode? b) {
  if (a == null || b == null) {
    return a == b;
  }
  return a.val == b.val &&
      isSameTree(a.left, b.left) &&
      isSameTree(a.right, b.right);
}
