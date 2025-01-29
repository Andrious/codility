import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/valid-parentheses/
/// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
///
/// An input string is valid if:
///
/// Open brackets must be closed by the same type of brackets.
/// Open brackets must be closed in the correct order.
/// Every close bracket has a corresponding open bracket of the same type.
///
///
/// Example 1:
///
/// Input: s = "()"
/// Output: true
/// Example 2:
///
/// Input: s = "()[]{}"
/// Output: true
/// Example 3:
///
/// Input: s = "(]"
/// Output: false
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s = "()";
    s = "()[]{}";
    s = "([])";
//    s = "(]";
    var result = isValid(s);
    final data = jsonEncode(result);
    return Text(data);
  }
}

bool isValid(String S) {
  // Genius! Pairs have the same index in String.
  const opening = "({[", closing = ")}]";
  final List<int> stack = [];
  int p;
  for (var i = 0; i < S.length; i++) {
    final c = S[i];
    // Open brackets
    if ((p = opening.indexOf(c)) != -1) {
      stack.add(p);
    } else {
      // p is -1
      // Closing brackets;
      if (stack.isEmpty || stack.removeLast() != closing.indexOf(c)) {
        return false;
      }
    }
  }
  return stack.isEmpty;
}

// bool isValid(String s) {
//   String round = "()";
//   String curly = "{}";
//   String square = "[]";
//   // If it becomes an empty string, it's valid.
//   while (s.isNotEmpty) {
//     if (s.contains(round)) {
//       s = s.replaceAll(round, '');
//     } else if (s.contains(curly)) {
//       s = s.replaceAll(curly, '');
//     } else if (s.contains(square)) {
//       s = s.replaceAll(square, '');
//     } else {
//       return false;
//     }
//   }
//   return true;
// }
