import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/valid-palindrome/
///
/// A phrase is a palindrome if, after converting all uppercase letters
/// into lowercase letters and removing all non-alphanumeric characters,
/// it reads the same forward and backward.
/// Alphanumeric characters include letters and numbers.
///
/// Given a string s, return true if it is a palindrome, or false otherwise.
///
///
//
/// Example 1:
///
/// Input: s = "A man, a plan, a canal: Panama"
/// Output: true
/// Explanation: "amanaplanacanalpanama" is a palindrome.
/// Example 2:
///
/// Input: s = "race a car"
/// Output: false
/// Explanation: "raceacar" is not a palindrome.
/// Example 3:
///
/// Input: s = " "
/// Output: true
/// Explanation: s is an empty string "" after removing non-alphanumeric characters.
/// Since an empty string reads the same forward and backward, it is a palindrome.
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
  final lowerCaseString = // lowercase & remove all non-alphanumeric characters
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
