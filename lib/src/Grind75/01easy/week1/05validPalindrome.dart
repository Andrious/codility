import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

///
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s = "A man, a plan, a canal: Panama";
    s = 'Dogma: I am God';
    s = 'Never odd or even';
    s = 'Do geese see God?';
    var result = isPalindrome(s);
    final data = jsonEncode(result);
    return Text(data);
  }
}

bool isPalindrome(String s) {
  final lowerCaseString =
      s.toLowerCase().replaceAll(RegExp(r'[^A-Za-z0-9]+'), '');
  int startIndex = 0;
  int lastIndex = lowerCaseString.length - 1;
  while (lastIndex > startIndex) {
    if (lowerCaseString[startIndex] != lowerCaseString[lastIndex]) {
      return false;
    }
    startIndex++;
    lastIndex--;
  }
  return true;
}
