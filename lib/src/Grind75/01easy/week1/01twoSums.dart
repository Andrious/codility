import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/two-sum/
/// Given an array of integers nums and an integer target,
/// return indices of the two numbers such that they add up to target.
///
/// You may assume that each input would have exactly one solution,
/// and you may not use the same element twice.

/// Example 1:
///
/// Input: nums = [2,7,11,15], target = 9
/// Output: [0,1]
/// Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
/// Example 2:
///
/// Input: nums = [3,2,4], target = 6
/// Output: [1,2]
/// Example 3:
///
/// Input: nums = [3,3], target = 6
/// Output: [0,1]
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nums = [2, 7, 11, 15];
    var target = 9;
    nums = [3, 2, 4];
    target = 6;
    var result = twoSum(nums, target);
    // You can encode your List of int as String
    final data = jsonEncode(result);
    return Text(data);
  }
}

//
List<int> twoSum(List<int> nums, int target) {
  final map = <int, int>{};

  for (int x = 0; x <= nums.length - 1; x++) {
    int remains = target - nums[x]; //Determine what number we need
    if (map.containsKey(remains)) {
      // The Map's key IS the number!
      return [map[remains]!, x];
    }
    map[nums[x]] = x;
  }

  return [];
}
