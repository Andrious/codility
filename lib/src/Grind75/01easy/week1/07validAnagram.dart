import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/valid-anagram/
///
/// Given two strings s and t,
/// return true if t is an anagram of s,
/// and false otherwise.
///
/// An Anagram is a word or phrase formed by rearranging the letters of
/// a different word or phrase,
/// typically using all the original letters exactly once.
///
/// Example 1:
///
/// Input: s = "anagram", t = "nagaram"
/// Output: true
///
/// Example 2:
///
/// Input: s = "rat", t = "car"
/// Output: false
///
/// Constraints:
///
/// 1 <= s.length, t.length <= 5 * 104
/// s and t consist of lowercase English letters.
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s = 'act';
    var t = 'cat';
    s = 'players';
    t = 'parsley';
    var result = isAnagram(s, t);
    final data = jsonEncode(result);
    return Text(data);
  }
}

bool isAnagram(String s, String t) {
  // A String to an Array
  var a = s.split('');
  var b = t.split('');
  // In alphabetical order
  a.sort();
  b.sort();
  // An Array to a String
  final w = a.join();
  final e = b.join();
  return w == e;
}
