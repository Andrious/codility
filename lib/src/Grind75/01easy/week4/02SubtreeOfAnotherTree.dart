import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/subtree-of-another-tree/
///
/// Given the roots of two binary trees root and subRoot,
/// return true if there is a subtree of root with the same structure
/// and node values of subRoot and false otherwise.
///
/// A subtree of a binary tree tree is a tree that consists of a node in tree
/// and all of this node's descendants. The tree tree could also
/// be considered as a subtree of itself.
///
/// Example 1:
///
/// Input: root = [3,4,5,1,2], subRoot = [4,1,2]
/// Output: true
///
/// Example 2:
///
/// Input: root = [3,4,5,1,2,null,null,null,null,0], subRoot = [4,1,2]
/// Output: false
///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final root = createTree([3, 4, 5, 1, 2], 0);
    final subRoot = createTree([4, 1, 2], 0);
    var result = isSubtree(root, subRoot);
    final data = jsonEncode(result);
    return Text(data);
  }
}

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
