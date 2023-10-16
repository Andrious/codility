import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
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
    // Tuncation division. 'Middle' index.
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
