import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

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
    rev = rev * 10 + n % 10;
    n = (n / 10).floor();
  }
  return x == rev; //(x == rev || x == (x / 10).floor());
}
