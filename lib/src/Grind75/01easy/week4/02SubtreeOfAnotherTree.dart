import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // root = [6, 2, 8, 0, 4, 7, 9, null, null, 3, 5];
    // treeNode = createTree(root, 0);
    var result = [];
    final data = jsonEncode(result);
    return Text(data);
  }
}

/// Given the roots of two binary trees root and subRoot,
/// return true if there is a subtree of root with the same structure
/// and node values of subRoot and false otherwise.
///
/// A subtree of a binary tree tree is a tree that consists of a node in tree
/// and all of this node's descendants. The tree tree could also
/// be considered as a subtree of itself.

bool isSubtree(TreeNode? root, TreeNode? subRoot) {
  if (root == null) return false;
  // The subtree was found
  if (_isSubtree(root, subRoot)) return true;
  // The OR allows for the subtree to be found.
  return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot);
}

bool _isSubtree(TreeNode? root, TreeNode? subRoot) {
  // If we reach the end of them both, 'true' so far.
  if (root == null && subRoot == null) return true;
  // If we reach the end of one of them so now not true
  if (root == null || subRoot == null) return false;
  // Doesn't match in this part of the tree.
  if (root.val != subRoot.val) return false;
  // if the subTree was found this will return true.
  return _isSubtree(root.left, subRoot.left) &&
      _isSubtree(root.right, subRoot.right);
}
