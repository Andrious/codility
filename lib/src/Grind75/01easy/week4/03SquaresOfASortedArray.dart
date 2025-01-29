import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/squares-of-a-sorted-array/
///
/// Given an integer array nums sorted in non-decreasing order,
/// return an array of the squares of each number sorted in
/// non-decreasing order.
///
/// Example 1:
///
/// Input: nums = [-4,-1,0,3,10]
/// Output: [0,1,9,16,100]
/// Explanation: After squaring, the array becomes [16,1,0,9,100].
/// After sorting, it becomes [0,1,9,16,100].
///
/// Example 2:
///
/// Input: nums = [-7,-3,2,3,11]
/// Output: [4,9,9,49,121]
///
///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nums = [-4, -1, 0, 3, 10];
//    nums = [-7, -3, 2, 3, 11];
    var result = sortedSquares(nums);
    final data = jsonEncode(result);
    return Text(data);
  }
}

List<int> sortedSquares(List<int> nums) {
  List<int> squares = nums.map((value) => value * value).toList();
  squares.sort();
  return squares;
}

List<int> sortedSquares02(List<int> nums) {
  // The number of elements in the array.
  int n = nums.length;
  // Filling resulting array with zeros.
  final result = List.filled(n, 0);
  // Include zero in the index.
  int i = 0, j = n - 1;
  // Populating the resulting array from back to front.
  for (int p = n - 1; p >= 0; p--) {
    // Which one goes next from largest to smallest
    if (nums[i].abs() > nums[j].abs()) {
      // simply square.
      result[p] = nums[i] * nums[i];
      i++;
    } else {
      // simply square.
      result[p] = nums[j] * nums[j];
      j--;
    }
  }
  return result;
}
