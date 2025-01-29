import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// Given an integer array nums, find the subarray
/// with the largest sum, and return its sum.

class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4];
    var result = maxSubArray(nums);
    final data = jsonEncode(result);
    return Text(data);
  }
}

int maxSubArray02(List<int> nums) {
  //
  int maxSum = -2630000, sum = 0;

  for (int i = 0; i < nums.length; i++) {
    //
    sum += nums[i];

    if (sum < 0) {
      sum = 0;
    }

    if (sum > maxSum) {
      maxSum = sum;
    }
  }
  return maxSum;
}

int maxSubArray(List<int> nums) {
  int maxSum = nums[0];
  int curSum = nums[0];

  for (int i = 1; i < nums.length; i++) {
    curSum = max(curSum + nums[i], nums[i]);
    maxSum = max(maxSum, curSum);
  }

  return maxSum;
}
