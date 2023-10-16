import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
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

int missingNumber(List<int> nums) {
  int xor = 0, i = 0;
  for (i = 0; i < nums.length; i++) {
    xor = xor ^ i ^ nums[i];
  }
  return xor ^ i;
}
