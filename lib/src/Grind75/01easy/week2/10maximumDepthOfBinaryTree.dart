import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;
import 'dart:math';

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var root = [1, null, 2];
    var treeNode = createTree(root);
    var result = maxDepth(treeNode);
    final data = jsonEncode(result);
    return Text(data);
  }
}

///
/// Given the root of a binary tree, return its maximum depth.
///
/// A binary tree's maximum depth is the number of nodes along the
/// longest path from the root node down to the farthest leaf node.
/// Input: root = [3,9,20,null,null,15,7]
/// Output: 3

/// Input: root = [1,null,2]
/// Output: 2
int maxDepth(TreeNode? root) {
  // Gets down to the bottom of the branch first then 'counts' back up.
  if (root == null) {
    return 0;
  }

  int left = maxDepth(root.left);

  int right = maxDepth(root.right);

  //height of the node at this point is max of LST & RST + 1 for this node.
  return 1 + max(left, right);
}
