import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/binary-search/
/// Given an array of integers nums which is sorted in ascending order,
/// and an integer target, write a function to search target in nums.
///
/// If target exists, then return its index. Otherwise, return -1.
///
/// You must write an algorithm with O(log n) runtime complexity.
///
/// Example 1:
///
/// Input: nums = [-1,0,3,5,9,12], target = 9
/// Output: 4
/// Explanation: 9 exists in nums and its index is 4
/// Example 2:
///
/// Input: nums = [-1,0,3,5,9,12], target = 2
/// Output: -1
/// Explanation: 2 does not exist in nums so return -1
///
/// Constraints:
///
/// 1 <= nums.length <= 104
/// -104 < nums[i], target < 104
///
/// All the integers in nums are unique.
/// nums is sorted in ascending order.
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nums = [-1, 0, 3, 5, 9, 12];
    var target = 9;
    var result = search(nums, target);
//    result = nums.indexOf(target);
    final data = jsonEncode(result);
    return Text(data);
  }
}

int search(List<int> nums, int target) {
  int low = 0;
  int high = nums.length - 1;

  while (low <= high) {
    // Truncation division. 'Middle' index.
    int mid = (low + high) ~/ 2;

    if (nums[mid] == target) {
      return mid;
      // Known the list is numeric order
      // If middle is less than target
    } else if (nums[mid] < target) {
      // Go to the top half
      low = mid + 1;
    } else {
      // Go to the bottom half
      high = mid - 1;
    }
  }
  return -1;
}
