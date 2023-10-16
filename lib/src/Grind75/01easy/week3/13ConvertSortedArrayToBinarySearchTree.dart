import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

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

/// Given an integer array nums where the elements are sorted in ascending order,
/// convert it to a height-balanced binary search tree.
///
/// A height-balanced binary tree is a binary tree in which
/// the depth of the two subtrees of every node never differs
/// by more than one.

TreeNode? sortedArrayToBST(List<int?> nums) {
  if (nums.isEmpty) {
    return null;
  }
  TreeNode? head = helper(nums, 0, nums.length - 1);
  return head;
}

TreeNode? helper(List<int?> nums, int low, int high) {
  if (low > high) {
    return null;
  }
  TreeNode? node;
  int mid = ((low + high) / 2).floor();
  if (nums[mid] != null) {
    node = TreeNode(nums[mid]!);
    node.left = helper(nums, low, mid - 1);
    node.right = helper(nums, mid + 1, high);
  }
  return node;
}
