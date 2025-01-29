import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/
///
/// Given a binary search tree (BST),
/// find the lowest common ancestor (LCA) node of two given nodes in the BST.
///
/// According to the definition of LCA on Wikipedia:
/// “The lowest common ancestor is defined between two nodes p and q as the lowest node in T
/// that has both p and q as descendants (where we allow a node to be a descendant of itself).”
///
/// Example 1:
///
/// Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
/// Output: 6
/// Explanation: The LCA of nodes 2 and 8 is 6.
///
/// Example 2:
///
/// Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
/// Output: 2
/// Explanation: The LCA of nodes 2 and 4 is 2,
/// since a node can be a descendant of itself according to the LCA definition.
//
/// Example 3:
///
/// Input: root = [2,1], p = 2, q = 1
/// Output: 2
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int?> root;
    TreeNode? treeNode;
    root = [2, 1];
    root = [6, 2, 8, 0, 4, 7, 9, null, null, 3, 5];
    treeNode = createTree(root, 0);
    final p = TreeNode(3);
    final q = TreeNode(5);

    var lca = lowestCommonAncestor(treeNode!, p, q);
    final result = lca?.val ?? 0;
    final data = jsonEncode(result);
    return Text(data);
  }
}

///
TreeNode? lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
  // it is BST so that we should take advantage of it
  // there is only three cases

// 1st one is that if both p & q are smaller than the root then call the left subtree
  if (p.val < root.val && q.val < root.val) {
    if (root.left == null) {
      return root;
    } else {
      return lowestCommonAncestor(root.left!, p, q);
    }
  }
  // 2nd if both p & q are greater than the root then call the right subtree
  else if (p.val > root.val && q.val > root.val) {
    if (root.right != null) {
      return root;
    } else {
      return lowestCommonAncestor(root.right!, p, q);
    }
  }
  // 3rd is that we get our answer that is root :)
  else {
    return root;
  }
}

// TreeNode? createTree(List<int?> nodes, int index,
//     [TreeNode? treeNode, int inc = 0]) {
//   //
//   if (treeNode != null) {
//     if (index >= nodes.length) {
//       return null;
//     }
//     var node = nodes[index];
//     if (node != null) {
//       treeNode.left = TreeNode(node);
//     }
//     index++;
//     if (index >= nodes.length) {
//       return null;
//     }
//     node = nodes[index];
//     if (node != null) {
//       treeNode.right = TreeNode(node);
//     }
//     createTree(nodes, inc + index + 1, treeNode.left, 2);
//     createTree(nodes, inc + index + 3, treeNode.right, 4);
//   } else {
//     if (index == 0) {
//       treeNode = createTree(nodes, index + 1, TreeNode(nodes[index]!));
//     }
//   }
//   return treeNode;
// }
//
// class TreeNode {
//   int val;
//   TreeNode? left;
//   TreeNode? right;
//   TreeNode([this.val = 0, this.left, this.right]);
// }
