import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/missing-number/
///
/// Given an array nums containing n distinct numbers in the range [0, n],
/// return the only number in the range that is missing from the array.
///
/// The basic idea is to use XOR operation. We all know that a^b^b =a,
/// which means two xor operations with the same number will eliminate the number
/// and reveal the original number.
/// In this solution, I apply XOR operation to both the index and
/// value of the array. In a complete array with no missing numbers,
/// the index and value should be perfectly corresponding( nums[index] = index),
/// so in a missing array, what left finally is the missing number.

/// Works only because 0 is included in the array of integers.
///
/// Example 1:
///
/// Input: nums = [3,0,1]
/// Output: 2
/// Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.
///
/// Example 2:
///
/// Input: nums = [0,1]
/// Output: 2
/// Explanation: n = 2 since there are 2 numbers, so all numbers are in the range [0,2]. 2 is the missing number in the range since it does not appear in nums.
///
/// Example 3:
///
/// Input: nums = [9,6,4,2,3,5,7,0,1]
/// Output: 8
/// Explanation: n = 9 since there are 9 numbers, so all numbers are in the range [0,9]. 8 is the missing number in the range since it does not appear in nums.

class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nums = [3, 0, 1];
    nums = [0, 1];
    nums = [9, 6, 4, 2, 3, 5, 7, 0, 1];
    var result = missingNumber(nums);
    final data = jsonEncode(result);
    return Text(data);
  }
}

int missingNumber(List<int> nums) {
  int xor = 0, i = 0;
  for (i = 0; i < nums.length; i++) {
    xor = xor ^ i ^ nums[i];
  }
  return xor ^ i;
}
