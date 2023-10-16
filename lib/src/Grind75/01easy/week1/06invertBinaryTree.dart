import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
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

TreeNode? invertTree(TreeNode? root) => root == null
    ? root
    : TreeNode(root.val, invertTree(root.right), invertTree(root.left));
