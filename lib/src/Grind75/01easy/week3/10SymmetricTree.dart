import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
/// https://leetcode.com/problems/symmetric-tree/
///
/// Given the root of a binary tree,
/// check whether it is a mirror of itself
/// (i.e., symmetric around its center).
///
/// Example 1:
///
/// Input: root = [1,2,2,3,4,4,3]
/// Output: true
///
/// Example 2:
///
/// Input: root = [1,2,2,null,3,null,3]
/// Output: false
///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int?> list = [1, 2, 2, 3, 4, 4, 3];
//    list = [1, 2, 2, null, 3, null, 3];
    final root = createTree(list, 0);
    var result = isSymmetric(root);
    final data = jsonEncode(result);
    return Text(data);
  }
}

bool isSymmetric(TreeNode? root) {
  // Test only for null.
  return root == null || asSysmetric(root.left, root.right);
}

bool asSysmetric(TreeNode? leftNode, TreeNode? rightNode) {
  // Test if null.
  if (leftNode == null || rightNode == null) {
    return leftNode == rightNode;
    // Moment they don't equal, it's over.
  } else if (leftNode.val != rightNode.val) {
    return false;
  } else {
    // Continue on the left side and on the right side.
    return asSysmetric(leftNode.left, rightNode.right) &&
        asSysmetric(leftNode.right, rightNode.left);
  }
}
