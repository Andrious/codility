import 'package:flutter/material.dart';
import 'dart:convert' show jsonEncode;

import '../../_view.dart';

/// https://leetcode.com/problems/longest-palindrome/
///
/// Given a string s which consists of lowercase or uppercase letters, return the length of the longest palindrome that can be built with those letters.
///
/// Letters are case sensitive, for example, "Aa" is not considered a palindrome here.
///
/// Example 1:
///
/// Input: s = "abccccdd"
/// Output: 7
/// Explanation: One longest palindrome that can be built is "dccaccd", whose length is 7.
/// Example 2:
///
/// Input: s = "a"
/// Output: 1
/// Explanation: The longest palindrome that can be built is "a", whose length is 1.
class Solution extends StatelessWidget {
  const Solution({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var s = 'abccccdd';
    var result = longestPalindrome(s);
    final data = jsonEncode(result);
    return Text(data);
  }
}

/// All it's really doing is counting pairs!
int longestPalindrome(String s) {
  // // to make it only alphanumeric and case-insensitive
  // final lowerCaseString =
  // s.toLowerCase().replaceAll(RegExp(r'[^A-Za-z0-9]+'), '');
  Map<String, int> charCounts = {};
  int maxLength = 0;
  for (int i = 0; i < s.length; i++) {
    final char = s[i];
    // Map must be case-sensitive.
    // Slick! Map returns null and so use ??
    charCounts[char] = (charCounts[char] ?? 0) + 1;
    // Count any pairs as 2 then clear
    if (charCounts[char]! % 2 == 0) {
      // maxLength = maxLength + 2
      maxLength += 2;
      charCounts[char] = 0;
    }
  }
  // Cool! Test integer is even or not!
  final evenCount = maxLength.isEven;
  4.gcd(2);

  // Integer
  //
  // isOdd
  /// Returns the greatest common divisor of this integer and [other].
  /// Example:
  /// ```dart
  /// print(4.gcd(2)); // 2
  /// print(8.gcd(4)); // 4
  /// print(10.gcd(12)); // 2
  /// print(10.gcd(0)); // 10
  /// print((-2).gcd(-3)); // 1
  /// ```
  // int gcd(int other);

  // You just need to count one character without a pair so 'any' returns true
  return maxLength + (charCounts.values.any((elem) => elem % 2 == 1) ? 1 : 0);
}

// Iterables
// bool any(bool test(E element))    //True if any element of this iterable satisfies [test].
// bool every(bool test(E element)) // True if all elements satisfies [test].
// String join([String separator = ""]) // Converts each element to a [String] and concatenates the strings.

// Reduces a collection to a single value by iteratively combining each
// element of the collection with an existing value.
// T fold<T>(T initialValue, T combine(T previousValue, E element)) {

// Reduces a collection to a single value by iteratively combining elements
// of the collection using the provided function.
// E reduce(E combine(E value, E element))

// Creates a lazy iterable of the [count] first elements of this iterable.
// Iterable<E> take(int count)
