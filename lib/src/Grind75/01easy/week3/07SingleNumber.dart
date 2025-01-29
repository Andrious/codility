import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
/// Given a non-empty array of integers nums,
/// every element appears twice except for one.
/// Find that single one.
///
/// You must implement a solution with a linear runtime complexity and
/// use only constant extra space.
///
/// Example 1:
///
/// Input: nums = [2,2,1]
/// Output: 1
/// Example 2:
///
/// Input: nums = [4,1,2,1,2]
/// Output: 4
/// Example 3:
///
/// Input: nums = [1]
/// Output: 1
///
/// Given a non-empty array of integers nums, every element appears twice except
/// for one. Find that single one.
///
/// You must implement a solution with a linear runtime complexity and use only
/// constant extra space.
///
/// The basic idea is to use XOR operation. We all know that a^b^b =a,
/// which means two xor operations with the same number will eliminate the number
/// and reveal the original number.

/// Using Bit Manipulation -
///
/// As we know XOR operation with 0 gives the same number
/// i.e, a XOR 0 = a
/// eg, for decimal no. 2=> 2 XOR 0 = 2
/// in binary, 010 XOR 000 = 010
///
/// Also we know that , XOR operation with same number gives 0
/// i.e, a XOR a = 0
/// eg, 2 XOR 2 = 0
/// in binary, 010 XOR 010 = 000
///
/// XOR is associative (like sum)
/// i.e, (2 XOR 3) XOR 4 = 2 XOR (3 XOR 4), So the order doesn't matter in performing XOR operation.
/// eg, 2^3^4^6 = 3^2^6^4 = 4^2^6^3 ......
///
/// So, using these three properties of XOR ,
/// we will solve the question.
/// we will take ans variable with 0 as initial value.
/// And then for each element i in array,
/// we will perform the XOR operation of the element with 0,
/// ans will become 0 if the same number is found (as a XOR a = 0)
/// and so after the completion of the loop,
/// only element with no duplicate number will remain
/// and will be returned as ans.
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nums = [2, 2, 1];
    nums = [4, 1, 2, 1, 2];
//    nums = [1];
    var result = singleNumber(nums);
    final data = jsonEncode(result);
    return Text(data);
  }
}

int singleNumber(List<int> nums) {
  int result = 0;
  for (int num in nums) {
    /// XOR operation with 0 gives the same number
    /// i.e, a XOR 0 = a
    /// XOR operation with same number gives 0
    /// i.e, a XOR a = 0
    /// after the completion, only element with no duplicates will remain
    result = result ^ num;
  }
  return result;
}
