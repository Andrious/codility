import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/roman-to-integer/
///
/// Input: s = "III"
/// Output: 3
/// Explanation: III = 3.
///
/// Input: s = "LVIII"
/// Output: 58
/// Explanation: L = 50, V= 5, III = 3.
///
/// Input: s = "MCMXCIV"
/// Output: 1994
/// Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s = "III";
    s = "LVIII";
    // s = "MCMXCIV";
    var result = romanToInt(s);
    final data = jsonEncode(result);
    return Text(data);
  }
}

int romanToInt(String s) {
  // You'll go through this list in this order and remove those not found.
  final romans = <String, int>{
    'IV': 4,
    'IX': 9,
    'V': 5, // V after IV
    'I': 1, // I after IX and IV
    'XL': 40,
    'L': 50, // L after XL
    'XC': 90,
    'X': 10, // X after XL and XC
    'CD': 400,
    'CM': 900,
    'C': 100, // C after CD and CM
    'D': 500,
    'M': 1000,
  };

  int number = 0;

  for (final roman in romans.entries) {
    // Count how many times this roman numeral appears in the String.
    final match = roman.key.allMatches(s);
    final count = match.length;
    // Multiply its counterpart numeric value by that count
    // In most instances, count will be zero
    number += roman.value * count; // n * 0 = 0
    // Remove the Roman number from the string
    // so as not to repeat I in IV and IX, etc.
    s = s.replaceAll(roman.key, '');
    if (s.isEmpty) {
      break;
    }
  }
  return number;
}

/// Pattern
///
/// Iterable<Match> allMatches(String string, [int start = 0])
