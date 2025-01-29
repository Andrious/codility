import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/
///
/// Given an integer array nums where the elements are sorted in ascending order,
/// convert it to a height-balanced binary search tree.
///
/// A height-balanced binary tree is a binary tree in which
/// the depth of the two subtrees of every node never differs
/// by more than one.
///
/// Example 1:
///
/// Input: nums = [-10,-3,0,5,9]
/// Output: [0,-3,9,-10,null,5]
/// Explanation: [0,-10,5,null,-3,null,9] is also accepted:
///
/// Example 2:
///
/// Input: nums = [1,3]
/// Output: [3,1]
/// Explanation: [1,null,3] and [3,1] are both height-balanced BSTs.
///
///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nums = [6, 2, 8, 0, 4, 7, 9, null, null, 3, 5];
    nums = [-10, -3, 0, 5, 9];
    var result = sortedArrayToBST(nums);
    final data = jsonEncode(result);
    return Text(data);
  }
}

///  BST - Binary Search Tree
TreeNode? sortedArrayToBST(List<int?> nums) {
  if (nums.isEmpty) {
    return null;
  }
  TreeNode? head = bsTree(nums, 0, nums.length - 1);
  return head;
}

TreeNode? bsTree(List<int?> nums, int low, int high) {
  if (low > high) {
    return null;
  }
  TreeNode? node;
  int mid = ((low + high) / 2).floor();
  if (nums[mid] != null) {
    node = TreeNode(nums[mid]!);
    node.left = bsTree(nums, low, mid - 1);
    node.right = bsTree(nums, mid + 1, high);
  }
  return node;
}
