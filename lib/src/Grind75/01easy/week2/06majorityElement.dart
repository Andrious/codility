import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/majority-element/
/// Given an array nums of size n, return the majority element.
///
/// The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.
///
///
///
/// Example 1:
///
/// Input: nums = [3,2,3]
/// Output: 3
/// Example 2:
///
/// Input: nums = [2,2,1,1,1,2,2]
/// Output: 2
///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var numbs = [2, 2, 1, 1, 1, 2, 2];
    var result = majorityElement(numbs);
    final data = jsonEncode(result);
    return Text(data);
  }
}

int majorityElement(List<int> nums) {
  // Genius! The very nature of integers groups the dominate one.
  nums.sort();
  // 	Divide by 2, returning the integer part (drop the decimal half)
  // Use ~/ because majority element appears 'more than' n / 2 times.
  // You can assume there always is one in this question.
  return nums[nums.length ~/ 2];
}
