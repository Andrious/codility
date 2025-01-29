import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/backspace-string-compare/
///
/// Given two strings s and t, return true if they are equal when
/// both are typed into empty text editors. '#' means a backspace character.
///
/// Note that after backspacing an empty text, the text will continue empty.
///
///
///
/// Example 1:
///
/// Input: s = "ab#c", t = "ad#c"
/// Output: true
/// Explanation: Both s and t become "ac".
/// Example 2:
///
/// Input: s = "ab##", t = "c#d#"
/// Output: true
/// Explanation: Both s and t become "".
/// Example 3:
///
/// Input: s = "a#c", t = "b"
/// Output: false
/// Explanation: s becomes "c" while t becomes "b".
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String s = "ab#c", t = "ad#c";
    // s = "ab##";
    // t = "c#d#";
    // s = "a#c";
    // t = "b";
    var result = backspaceCompare(s, t);
    final data = jsonEncode(result);
    return Text(data);
  }
}

bool backspaceCompare(String s, String t) {
  return checkBackspace(s) == checkBackspace(t);
}

String checkBackspace(String s) {
  final stack = <String>[];
  final List<String> strList = s.split('');
  for (final value in strList) {
    if (value != '#') {
      stack.add(value);
    } else if (stack.isNotEmpty) {
      stack.removeLast();
    }
  }
  return stack.join('');
}

// bool backspaceCompare(String s, String t) {
//   //
//   int sPtr = s.length - 1;
//   int tPtr = t.length - 1;
//
//   while (sPtr >= 0 || tPtr >= 0) {
//     //
//     int sSkip = 0; // '#'
//
//     while (sPtr >= 0 && (s[sPtr] == '#' || sSkip > 0)) {
//       //
//       if (s[sPtr] == '#') {
//         sSkip++;
//       } else {
//         sSkip--;
//       }
//       sPtr--;
//     }
//
//     int tSkip = 0; //
//
//     while (tPtr >= 0 && (t[tPtr] == '#' || tSkip > 0)) {
//       //
//       if (t[tPtr] == '#') {
//         tSkip++;
//       } else {
//         tSkip--;
//       }
//       tPtr--;
//     }
//
//     //
//     if ((sPtr >= 0) != (tPtr >= 0)) {
//       return false;
//     }
//     if (sPtr >= 0 && tPtr >= 0 && s[sPtr] != t[tPtr]) {
//       return false;
//     }
//
//     sPtr--;
//     tPtr--;
//   }
//
//   return true;
// }
