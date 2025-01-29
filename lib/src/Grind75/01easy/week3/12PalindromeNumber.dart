import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/palindrome-number/
///
/// Given an integer x, return true if x is a palindrome, false otherwise.
///
/// Example 1:
///
/// Input: x = 121
/// Output: true
/// Explanation: 121 reads as 121 from left to right and from right to left.
///
/// Example 2:
///
/// Input: x = -121
/// Output: false
/// Explanation: From left to right, it reads -121. From right to left, it becomes 121-.
/// Therefore it is not a palindrome.
///
/// Example 3:
///
/// Input: x = 10
/// Output: false
/// Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
///
///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var x = 121;
//    x = -121;
//    x = 10;
    var result = isPalindrome(x);
    final data = jsonEncode(result);
    return Text(data);
  }
}

/// Given an integer x, return true if x is a palindrome and false otherwise.
/// compare half of the digits in x, so don't need to deal with overflow.
bool isPalindrome(int x) {
  // if (x < 0 || (x != 0 && x % 10 == 0)) {
  //   return false;
  // }
  var n = x;
  var rev = 0;
  while (n > 0) {
    // To get the last digit (make room by multiplying by 10 then mods)
    rev = (rev * 10) + n % 10;
    n = (n / 10).floor();
  }
  return x == rev; //(x == rev || x == (x / 10).floor());
}
