import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;
import 'dart:math';

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var root = [1, 2, 3, 4, 5];
    var treeNode = createTree(root);
    var result = diameterOfBinaryTree(treeNode);
    final data = jsonEncode(result);
    return Text(data);
  }
}

/// The diameter of a binary tree is the length
/// of the longest path between any two nodes in a tree.
/// This path may or may not pass through the root.
///
/// The length of a path between two nodes is
/// the number of 'lines' between them.
///
/// Input: root = [1,2,3,4,5]
/// Output: 3
/// Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].
int diameterOfBinaryTree(TreeNode? root) => maxLevels(root);

/// A high-level variable stores the diameter.
int diameter = 0;

///
/// For every node, length of longest path which pass it equals
/// MaxDepth of its left subtree + MaxDepth of its right subtree+2.
int maxLevels(TreeNode? root) {
  // Gets down to the bottom of the branch first then 'counts' back up.
  if (root == null) {
    return 0;
  }

  int left = maxLevels(root.left);

  int right = maxLevels(root.right);

  //(no. of nodes farthest apart) or the DIAMETER
  diameter = max(diameter, left + right);

  //height of the node at this point is max of LST & RST + 1
  return 1 + max(left, right);
}
