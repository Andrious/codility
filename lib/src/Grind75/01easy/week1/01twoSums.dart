import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
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
