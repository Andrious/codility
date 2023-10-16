import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nums = [0, 1, 0, 3, 12];
//    nums = [0];
    var result = moveZeroes(nums);
    final data = jsonEncode(result);
    return Text(data);
  }
}

/// Given an integer array nums, move all 0's to the end of it
/// while maintaining the relative order of the non-zero elements.
/// Note that you must do this in-place without making a copy of the array.

List<int> moveZeroes(List<int> nums) {
  int snowBallSize = 0;
  for (int i = 0; i < nums.length; i++) {
    if (nums[i] == 0) {
      snowBallSize++;
    } else if (snowBallSize > 0) {
      int t = nums[i];
      nums[i] = 0;
      // if the current element is not zero.
      // Swap to the index less the current number of zeros.
      // Only works if zeros collect on the end of the array.
      nums[i - snowBallSize] = t;
    }
  }
  return nums;
}
