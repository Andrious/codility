import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/invert-binary-tree/
///
/// Given the root of a binary tree, invert the tree, and return its root.
///
/// Example 1:
///
///
/// Input: root = [4,2,7,1,3,6,9]
/// Output: [4,7,2,9,6,3,1]
///
/// Example 2:
///
///
/// Input: root = [2,1,3]
/// Output: [2,3,1]
///
/// Example 3:
///
/// Input: root = []
/// Output: []
///
///
/// Constraints:
///
/// The number of nodes in the tree is in the range [0, 100].
/// -100 <= Node.val <= 100
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int> root;
    TreeNode? treeNode;
    root = [4, 2, 7, 1, 3, 6, 9];
    treeNode = createTree(root);
    // root = [2, 1, 3];
    // treeNode = createTree(root);
    var result = invertTree(treeNode);
    const data = "done!";
    return const Text(data);
  }
}

TreeNode? invertTree(TreeNode? root) => root == null
    ? root
    : TreeNode(root.val, invertTree(root.right), invertTree(root.left));

// /// root = [4,2,7,1,3,6,9]
// TreeNode createTree(List<int> nodes) {
//   TreeNode treeNode;
//   const i = 0;
//   if (nodes.length > 3) {
//     final subNodes = nodes.sublist(i + 3);
//     int half = (subNodes.length / 2).floor();
//     final List<int> leftNodes = [nodes[i + 1]] + subNodes.sublist(0, half);
//     final List<int> rightNodes = [nodes[i + 2]] + subNodes.sublist(half);
//     treeNode =
//         TreeNode(nodes[i], createTree(leftNodes), createTree(rightNodes));
//   } else if (nodes.length == 3) {
//     treeNode =
//         TreeNode(nodes[i], TreeNode(nodes[i + 1]), TreeNode(nodes[i + 2]));
//   } else {
//     treeNode = TreeNode(nodes[0]);
//   }
//   return treeNode;
// }

// class TreeNode {
//   int val;
//   TreeNode? left;
//   TreeNode? right;
//   TreeNode([this.val = 0, this.left, this.right]);
// }
